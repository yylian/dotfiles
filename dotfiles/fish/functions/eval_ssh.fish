function eval_ssh
    eval $(keychain --eval --quiet  ~/.ssh/id_ed25519)
end
