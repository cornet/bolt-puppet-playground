plan profiles::ipcalc(
  TargetSpec $nodes,
) {
  # Installs puppet
  $nodes.apply_prep

  apply($nodes) {
    class {'::profiles::ipcalc': }
  }
}
