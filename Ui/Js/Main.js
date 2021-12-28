handleLoad = () => {
    let blipsIncluded = 0
    let items = ["home", "add", "edit", "setting"]
    document.getElementById("home").style.color = "#7587fb"
    items.forEach((val) => {
        document.getElementById(val).addEventListener("click", () => {
            document.getElementById(val).style.color = "#7587fb"
            items.forEach((val2) => {
                console.log()
                if (!(val2 === val)) {
                    document.getElementById(val2).style.color = "white"
                }
            })
        })
    })
    
    $(".addblip").on("click", function () {  
        blipsIncluded++
        $("#blippart").append(`
            <div id="blip-${blipsIncluded}" style="margin-top: 1vw">
                <input class="input blipin" id="blip-${blipsIncluded}-x" placeholder="X"></input>
                <input class="input blipin" id="blip-${blipsIncluded}-y" placeholder="Y"></input>
                <input class="input blipin" id="blip-${blipsIncluded}-z" placeholder="Z"></input>
                <input class="input blipin" id="blip-${blipsIncluded}-text" placeholder="Text"></input>
                <input class="input blipin" id="blip-${blipsIncluded}-color" placeholder="Color"></input>
                <input class="input blipin" id="blip-${blipsIncluded}-sprite" placeholder="Sprite"></input>
                <div id="blip-${blipsIncluded}-button" class="button actualcoords"><span class="text" style="font-size: .4vw;">Actual coords</span></div>
            </div>
        `)

    })

}

window.addEventListener("load", this.handleLoad)

