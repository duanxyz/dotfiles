import SystemTray from 'resource:///com/github/Aylur/ags/service/systemtray.js';
import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import Variable from 'resource:///com/github/Aylur/ags/variable.js';
import Notifications from 'resource:///com/github/Aylur/ags/service/notifications.js';
import Mpris from 'resource:///com/github/Aylur/ags/service/mpris.js';
import Battery from 'resource:///com/github/Aylur/ags/service/battery.js';
import OverviewButton from './buttons/OverviewButton.js';
import Workspaces from './buttons/Workspaces.js';
import FocusedClient from './buttons/FocusedClient.js';
import MediaIndicator from './buttons/MediaIndicator.js';
import DateButton from './buttons/DateButton.js';
import NotificationIndicator from './buttons/NotificationIndicator.js';
// import SysTray from './buttons/SysTray.js';
// import ColorPicker from './buttons/ColorPicker.js';
import SystemIndicators from './buttons/SystemIndicators.js';
import PowerMenu from './buttons/PowerMenu.js';
import ScreenRecord from './buttons/ScreenRecord.js';
import BatteryBar from './buttons/BatteryBar.js';
// import SubMenu from './buttons/SubMenu.js';
import Recorder from '../services/screenrecord.js';
// import * as System from './buttons/System.js';
// import Taskbar from './buttons/Taskbar.js';
import options from '../options.js';

const submenuItems = Variable(1);

SystemTray.connect('changed', () => {
  submenuItems.setValue(SystemTray.items.length + 1);
});

const SeparatorDot = (service, condition) =>
  Widget.Separator({
    vpack: 'center',
    setup: (self) => {
      const setVisibility = () => {
        let visibility = false;
        if (options.bar.separators.value) {
          visibility =
            condition && service
              ? condition(service)
              : options.bar.separators.value;
        }
        self.visible = visibility;
      };

      if (service && condition) {
        self.hook(service, setVisibility);
      }

      self.on('draw', setVisibility);
      self.bind('visible', options.bar.separators);
    },
  });

const createSeparatorDot = (service, condition) =>
  SeparatorDot(service, condition);

const Start = () =>
  Widget.Box({
    class_name: 'start',
    children: [
      OverviewButton(),
      createSeparatorDot(),
      FocusedClient(),
      Widget.Box({ hexpand: true }),
      NotificationIndicator(),
      createSeparatorDot(
        Notifications,
        (n) => n.notifications.length > 0 || n.dnd
      ),
    ],
  });

const Center = () =>
  Widget.Box({
    class_name: 'center',
    children: [Workspaces()],
  });

const End = () =>
  Widget.Box({
    class_name: 'end',
    children: [
      createSeparatorDot(Mpris, (m) => m.players.length > 0),
      MediaIndicator(),
      Widget.Box({ hexpand: true }),
      // SubMenu({
      //   items: submenuItems,
      //   children: [SysTray(), ColorPicker()],
      // }),
      createSeparatorDot(),
      ScreenRecord(),
      createSeparatorDot(Recorder, (r) => r.recording),
      SystemIndicators(),
      createSeparatorDot(Battery, (b) => b.available),
      BatteryBar(),
      createSeparatorDot(),
      DateButton(),
      createSeparatorDot(),
      PowerMenu(),
    ],
  });

export default (monitor) =>
  Widget.Window({
    name: `bar${monitor}`,
    class_name: 'transparent',
    exclusivity: 'exclusive',
    monitor,
    anchor: options.bar.position
      .bind('value')
      .transform((pos) => [pos, 'left', 'right']),
    child: Widget.CenterBox({
      class_name: 'panel',
      start_widget: Start(),
      center_widget: Center(),
      end_widget: End(),
    }),
  });
