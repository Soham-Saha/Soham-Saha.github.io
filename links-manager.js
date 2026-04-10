class Link {
    name = "";
    target = "";
    desc = "";
    date = "";
    constructor(name, target, desc, date) {
        this.name = name;
        this.target = target;
        this.desc = desc;
        this.date = date;
    }
}

function add_to(links, target){
    links.forEach(link => {
        target.innerHTML +=
            `<div class="link">
                    <a href="${link.target}">
                        <p class="name">${link.name}</p>
                    </a>
                    ${
                        link.date || link.desc ?
                        `<p class="desc">
                            ${(link.date ? `${link.date}\n<br>` : ``)}
                            ${(link.desc ? link.desc : ``)}
                        </p>` : ``
                    }
            </div>`;
    });
}