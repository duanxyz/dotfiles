{
  inputs,
  cell,
  pkgs,
}: {
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the Plasma 6 Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  environment.systemPackages = with pkgs; [
    kdePackages.spectacle
  ];

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    ark
    elisa
    gwenview
    okular
    kate
    khelpcenter
    print-manager
    ffmpegthumbs
  ];

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
  };
}
