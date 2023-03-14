function w_backend
    # drittes Terminal
    pyenv activate wacoplast_wws
    cd services/backend
    python main.py run-backend
end
