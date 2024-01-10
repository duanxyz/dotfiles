/* eslint-disable camelcase */
import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import App from 'resource:///com/github/Aylur/ags/app.js';

/**
 * @typedef {Object} PanelButtonProps
 * @property {import('types/widgets/button').ButtonProps['child']} content
 * @property {string=} window
 */

/**
 * @param {import('types/widgets/button').ButtonProps & PanelButtonProps} o
 */

export default ({ class_name, content, window = '', setup, ...rest }) =>
  Widget.Button({
    class_name: `panel-button ${class_name}`,
    child: Widget.Box({ children: [content] }),
    setup: (self) => {
      let isOpen = false;

      const handleAppVisibility = (_, win, visible) => {
        if (win !== window) return;

        if (isOpen && !visible) {
          isOpen = false;
          self.toggleClassName('active', false);
        }

        if (visible) {
          isOpen = true;
          self.toggleClassName('active');
        }
      };

      self.hook(App, handleAppVisibility);

      if (setup) setup(self);
    },
    ...rest,
  });
