MEM_LENGTH = 50
PT_COUNT = 1000

canv = document.getElementById('canvas')
ctx = canv.getContext('2d')
canv.width = Math.min(window.innerWidth, window.innerHeight) / 1.1;
canv.height = canv.width;
mem = []

s = new Float32Array(PT_COUNT*2)
for (i = 0; i < PT_COUNT*2; i+=2) {
        s[i]=Math.random() * canv.width;
        s[i+1]=Math.random() * canv.height;
}
function viewUpdater() {
        ctx.fillStyle = 'black'
        ctx.fillRect(0, 0, canv.width, canv.height)
        mem.push(s.map(k=>k));
        if (mem.length > MEM_LENGTH) {
                mem.shift();
        }
        mem_i = 0
        for(memCt=0;memCt<mem.length;memCt++){
                c = [0, 255, 255]
                ctx.fillStyle = `rgba(${c[0] * memCt/ MEM_LENGTH},${c[1] * memCt / MEM_LENGTH},${c[2] * memCt / MEM_LENGTH})`
                for(i=0;i<PT_COUNT*2;i+=2){
                        ctx.fillRect(mem[memCt][i],mem[memCt][i+1],0.5+1*memCt/MEM_LENGTH, 0.5+1*memCt/MEM_LENGTH);
                }
        }  
        
        
        //NEED TO REWRITE
        /*-ctx.fillStyle = 'black'
        ctx.fillRect(0, 0, canv.width, canv.height)
        for(i=0;i<PT_COUNT*2;i+=2){
                mem[memIndex*PT_COUNT*2+i]=s[i]
                mem[memIndex*PT_COUNT*2+i+1]=s[i+1]
        }
        memIndex=(memIndex+1)%MEM_LENGTH
        mem_i = 0
        for(memCt1=0;memCt1<MEM_LENGTH;memCt1++){
                memCt=(memIndex+memCt1)%MEM_LENGTH
                c = [0, 255, 255]
                ctx.fillStyle = `rgba(${c[0] * memCt/ MEM_LENGTH},${c[1] * memCt / MEM_LENGTH},${c[2] * memCt / MEM_LENGTH})`
                for(i=0;i<PT_COUNT*2;i+=2){
                        ctx.fillRect(mem[memCt*PT_COUNT*2+i],mem[memCt*PT_COUNT*2+i+1],0.5+1*memCt/MEM_LENGTH, 0.5+1*memCt/MEM_LENGTH);
                }
        }*/ 
        
}
function pointUpdater() {
        for (i = 0; i < s.length; i+=2) {
                vx = Math.log(Math.abs((s[i+1] - canv.height / 2) / 50));
                vy = Math.log(Math.abs((s[i] - canv.width / 2) / 50));
                s[i] = s[i] + vx * 0.5;
                s[i+1] = s[i+1] + vy * 0.5;
                if (s[i] > canv.width || s[i] < 0 || s[i+1] > canv.height || s[i+1] < 0 || Math.random() < 0.01) {
                        s[i] = Math.random() *canv.width;
                        s[i+1] = Math.random() *canv.height;
                }
        }
}
function update() {
        pointUpdater();
        viewUpdater();
        requestAnimationFrame(update);
}
update();
