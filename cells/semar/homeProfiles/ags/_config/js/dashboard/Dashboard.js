import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import DateColumn from './DateColumn.js';
import NotificationColumn from './NotificationColumn.js';
// eslint-disable-next-line import/no-named-as-default
import PopupWindow from '../misc/PopupWindow.js';
import options from '../options.js';

export default () =>
  PopupWindow({
    name: 'dashboard',
    setup: (self) => {
      self.hook(options.bar.position, () => {
        self.anchor = ['right', options.bar.position.value];
        self.transition =
          options.bar.position.value === 'top' ? 'slide_down' : 'slide_up';
      });
    },
    child: Widget.Box({
      vertical: true,
      children: [
        DateColumn(),
        Widget.Separator({ orientation: 1 }),
        NotificationColumn(),
      ],
    }),
  });
