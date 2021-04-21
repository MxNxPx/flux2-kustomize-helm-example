kubectl patch -n gatekeeper-system deployment gatekeeper-controller-manager --patch "$(cat gatekeeper-patch.yaml)"

