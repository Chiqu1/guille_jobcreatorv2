handleLoad = () => {
    let items = ["home", "add", "edit", "setting"]
    document.getElementById("home").style.color = "#7587fb"
    items.forEach((val) => {
        document.getElementById(val).addEventListener("click", () => {
            document.getElementById(val).style.color = "#7587fb"
            if (val === "add") {
                $(".data-wrapper").addClass("scale-out").fadeOut(200)
                setTimeout(() => {
                    $(".data-wrapper").removeClass("scale-out") 
                }, 200);
            } else if (val === "home") {

            }
            items.forEach((val2) => {
                console.log()
                if (!(val2 === val)) {
                    document.getElementById(val2).style.color = "white"
                }
            })
        })
    })

    $(".addblip").on("click", function () {
        $(".blippart").append(`
            <div style="margin-top: 1vw">
                <input class="input blipin" placeholder="X"></input>
                <input class="input blipin" placeholder="Y"></input>
                <input class="input blipin" placeholder="Z"></input>
                <input class="input blipin" placeholder="Text"></input>
                <input class="input blipin" placeholder="Color"></input>
                <input class="input blipin" placeholder="Sprite"></input>
                <div class="button actualcoords"><span class="text" style="font-size: .4vw;">Actual coords</span></div>
            </div>
        `)
    })
}

window.addEventListener("load", this.handleLoad)

