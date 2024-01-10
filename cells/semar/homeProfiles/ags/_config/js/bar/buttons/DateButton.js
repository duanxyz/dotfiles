import App from 'resource:///com/github/Aylur/ags/app.js';
import Clock from '../../misc/Clock.js';
import PanelButton from '../PanelButton.js';

export default ({ format = '%a %e %b %H:%M' } = {}) => {
  const createDashboardButton = () => {
    const onDashboardClicked = () => App.toggleWindow('dashboard');

    return PanelButton({
      class_name: 'dashboard panel-button',
      on_clicked: onDashboardClicked,
      window: 'dashboard',
      content: Clock({ format }),
    });
  };

  return createDashboardButton();
};
