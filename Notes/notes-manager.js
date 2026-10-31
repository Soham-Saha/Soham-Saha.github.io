class NoteLink {
    name = "";
    target = "";
    constructor(name, target, desc, date) {
        this.name = name;
        this.target = target;
    }
}

function add_to(links, target){
    list = ""
    links.forEach(link => {
        list +=`<li><a href="${link.target}"> ${link.name} </a></li>`;
    });
    target.innerHTML += `<ol>${list}</ol>`
}