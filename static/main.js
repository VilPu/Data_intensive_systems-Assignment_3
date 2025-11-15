const container = document.getElementById("container")

schoolsButton = document.getElementById("schools");
if (schoolsButton != null) {
    schoolsButton.addEventListener("click", async () => {
        db = getDB();
        await fetch("/schools?db=" + db)
            .then(response => response.text())
            .then(text => {
                container.innerHTML = text
            });
    })
}

facultiesButton = document.getElementById("faculties");
if (facultiesButton != null) {
    facultiesButton.addEventListener("click", async () => {
        db = getDB();
        await fetch("/faculties?db=" + db)
            .then(response => response.text())
            .then(text => container.innerHTML = text);

    })
}

personnelButton = document.getElementById("personnel");
if (personnelButton != null) {
    personnelButton.addEventListener("click", async () => {
        db = getDB();
        await fetch("/personnel?db=" + db)
            .then(response => response.text())
            .then(text => container.innerHTML = text);
    })
}

coursesButton = document.getElementById("courses");
if (coursesButton != null) {
    coursesButton.addEventListener("click", async () => {
        db = getDB();
        await fetch("/courses?db=" + db)
            .then(response => response.text())
            .then(text => container.innerHTML = text);


    })
}

gradesButton = document.getElementById("grades");
if (gradesButton != null) {
    gradesButton.addEventListener("click", async () => {
        db = getDB();
        await fetch("/grades?db=" + db)
            .then(response => response.text())
            .then(text => container.innerHTML = text);
    })
}


resetButton = document.getElementById("reset");
if (resetButton != null) {
    resetButton.addEventListener("click", () => {
        fetch("/reset")
    })
}

function getDB() {
    radioButtons = document.getElementsByName("db");
    for (let index = 0; index < radioButtons.length; index++) {
        const element = radioButtons[index];
        if (element.checked) {
            return element.value;
        }
    }
    return 0;
}

function submit_form(object) {
    form = document.getElementById("form");
    formData = new FormData(form);
    db = getDB();
    url = "/insert/" + object + "?db=" + db

    fetch(url, {
        method: "POST",
        body: formData
    })
        .then(response => response.text())
        .then(text => {
            container.innerHTML = text
            form.reset()
        })
}
