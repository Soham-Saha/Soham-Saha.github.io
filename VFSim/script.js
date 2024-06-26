class Point {
        x;
        y;
        vx;
        vy;
        constructor(x, y, vx=0, vy=0) {
                this.x = x;
                this.y = y;
                this.vx = vx;
                this.vy = vy;
        }
}

MEM_LENGTH = 50
PT_COUNT = 1000

canv = document.getElementById('canvas')
ctx = canv.getContext('2d')
canv.width = Math.min(window.innerWidth, window.innerHeight) / 1.1;
canv.height = canv.width;
mem = []

function randPoint() {
        return new Point(Math.random() * canv.width, Math.random() * canv.height);
}

s = []
for (i = 0; i < PT_COUNT; i++) {
        s.push(randPoint());
}
function viewUpdater() {
        ctx.fillStyle = 'black'
        ctx.fillRect(0, 0, canv.width, canv.height)
        const snap = s.map(p => [p.x, p.y]);
        mem.push(snap);
        if (mem.length > MEM_LENGTH) {
                mem.shift();
        }
        mem_i = 0
        mem.forEach(memInst => {
                c = [0, 255, 255]
                ctx.fillStyle = `rgb(${c[0] * mem_i / MEM_LENGTH},${c[1] * mem_i / MEM_LENGTH},${c[2] * mem_i / MEM_LENGTH})`
                memInst.forEach(p => {
                        ctx.fillRect(p[0], p[1], 1, 1)
                });
                mem_i++
        });
}
function pointUpdater() {
        for (i = 0; i < s.length; i++) {
                p = s[i]
                p.vx = Math.log(Math.abs((p.y - canv.height / 2) / 50));
                p.vy = Math.log(Math.abs((p.x - canv.width / 2) / 50));
                p.x = p.x + p.vx * 0.5;
                p.y = p.y + p.vy * 0.5;
                if (p.x > canv.width || p.x < 0 || p.y > canv.height || p.y < 0 || Math.random() < 0.01) {
                        s[i] = randPoint()
                }
        }
}
function update() {
        pointUpdater();
        viewUpdater();
        requestAnimationFrame(update);
}
update();