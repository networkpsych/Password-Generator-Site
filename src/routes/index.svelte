<script>
    import  RandExp  from 'randexp';
    import Clipboard from 'svelte-clipboard';
    import { text } from 'svelte/internal';

    let spec_char = true;
    let pass_len = 10;
    let pass_list = [];

    function password(pass_len) {
        var pass = ''
        
        if (spec_char) {
            let pass = new RandExp(`[0a-zA-Z0-9]{${pass_len}}`).gen()
            pass_list = [...pass_list, pass]
        } else {
            let pass = new RandExp(`.{${pass_len}}`).gen()
            pass_list = [...pass_list, pass]
        }
    }

    function clear_pass(){
        alert("Cleared passwords!")
        pass_list = []
    }

    function pass_len_size() {
        switch(pass_len) {
            case pass_len > 30 && pass_len !== 69:
                alert("The max amount of characters allowed is 30")
            case pass_len < 5:
                alert("The minimum amount of characters allowed is 5")
            
            case pass_len === 69:
                alert("nice")
       }
    }


</script>
<header>
    <h1>Password Generator</h1>
</header>

<body>
    <div class="password-selection">
        <label for="checkbox">
            Special Characters: {spec_char}    
            <input type="checkbox" bind:checked={spec_char}>
        </label>
        <label>
            <input bind:value={pass_len} placeholder="10">
        </label>
        {#if pass_len !== 69 && pass_len > 30 || pass_len < 5}
            <pass_len_size />
        {:else if pass_len < 30 && pass_len > 5 || pass_len === 69}
            <button type="button" on:click={password(pass_len)}>Generate Password</button>
        {/if}
        <Clipboard
            text = "${pass_list}"
            let:copy
            on:copy={() => {
                if (text.length > 0) {
                alert("Content has copied!");
                } else {
                    alert("There is nothing to copy!!")
                }
            }}>
            <button type="button" on:click={copy}>Copy to Clipboard</button>
        </Clipboard>
        {#if pass_list.length > 0}
            <button type="button" on:click={clear_pass}>Clear Passwords</button>
        {/if}
    </div>
    <div class="password-list">
        <div class="items">
            <ul style="list-style-type:none">
                {#each pass_list as item }
                <li style="margin-top: 15px">
                {item}
                </li>
                {/each}
            </ul>
        </div>
    </div>
</body>
<style>
    header {
        font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
        margin-left: 45%;
    }
    body {
        background-color: aliceblue;
    }
    button {
        background-color: blanchedalmond;
        text-align: center;
        font-size: large;
        align-items: stretch;
        font-style:inherit;
        font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
        font-weight: 900;
        width: fit-content;
        height: fit-content;

    }

    input {
        size: auto;
        width: auto;
        font-size: x-large;
        font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
        font-style:italic;
    }

    .password-selection {
        background-size: 10rem;
        justify-content: center;
        padding-left: 34%;
        margin-top: 5rem;
        font-size: larger;
        font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
        border-color: black;

    }
    

    .password-list{
        background-color: aliceblue;
        font-size: larger;
        font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
    }

    .items {
        align-items: center;
        justify-content: center;
        margin-left: 45%;
        margin-top: auto;
        font-size: x-large;
        font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;   
    }
</style>