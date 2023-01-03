function w_rest
    # viertes Terminal
    pyenv activate wacoplast_wws

    cd services/backend
    python main.py run-rest-api
end
