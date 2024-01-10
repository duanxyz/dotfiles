import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import SystemTray from 'resource:///com/github/Aylur/ags/service/systemtray.js';
import Gdk from 'gi://Gdk';
import PanelButton from '../PanelButton.js';

/** @param {import('types/service/systemtray').TrayItem} item */
const createSysTrayItem = (item) => {
  const handleMenuPopup = (trayMenu) => {
    trayMenu.disconnect(handleMenuPopup.id);
    handleMenuPopup.id = null;
  };

  const handleMenuVisible = (trayMenu) => {
    trayMenu.disconnect(handleMenuVisible.id);
    handleMenuVisible.id = null;
  };

  const setupMenuHandlers = (self) => {
    handleMenuPopup.id = item.menu?.connect('popped-up', (trayMenu) => {
      self.toggleClassName('active');
      handleMenuVisible.id = trayMenu.connect('notify::visible', (menu) => {
        self.toggleClassName('active', menu.visible);
      });
    });

    if (handleMenuPopup.id) {
      self.connect('destroy', () => item.menu?.disconnect(handleMenuPopup.id));
    }
  };

  return PanelButton({
    class_name: 'tray-item',
    content: Widget.Icon({ icon: item.bind('icon') }),
    tooltip_markup: item.bind('tooltip_markup'),
    setup: setupMenuHandlers,

    // @ts-expect-error popup_at_widget missing from types?
    on_primary_click: (btn) =>
      item.menu?.popup_at_widget(
        btn,
        Gdk.Gravity.SOUTH,
        Gdk.Gravity.NORTH,
        null
      ),

    // @ts-expect-error popup_at_widget missing from types?
    on_secondary_click: (btn) =>
      item.menu?.popup_at_widget(
        btn,
        Gdk.Gravity.SOUTH,
        Gdk.Gravity.NORTH,
        null
      ),
  });
};

export default () =>
  Widget.Box().bind('children', SystemTray, 'items', (trayItems) =>
    trayItems.map(createSysTrayItem)
  );
