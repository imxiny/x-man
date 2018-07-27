let max_particles    = 100;
let particles        = [];
let frequency        = 100;
let init_num         = max_particles;
let max_time         = frequency*max_particles;
let time_to_recreate = false;

// Enable repopolate
setTimeout(function(){
    time_to_recreate = true;
}.bind(this), max_time)

// Popolate particles
popolate(max_particles);

var tela = document.createElement('canvas');
tela.width = $("body").width() * 0.996;
tela.height = $("body").height() * 0.996;
$("body").append(tela);

var canvas = tela.getContext('2d');

class Particle{
    constructor(canvas, options){
        let colors = ["#feea00","#a9df85","#5dc0ad", "#ff9a00","#fa3f20"]
        let types  = ["full","fill","empty"]
        this.random = Math.random()
        this.canvas = canvas;
        this.progress = 0;

        this.x = ($(window).width()/2)  + (Math.random()*200 - Math.random()*200)
        this.y = ($(window).height()/2) + (Math.random()*200 - Math.random()*200)
        this.w = $(window).width()
        this.h = $(window).height()
        this.radius = 1 + (8*this.random)
        this.type  = types[this.randomIntFromInterval(0,types.length-1)];
        this.color = colors[this.randomIntFromInterval(0,colors.length-1)];
        this.a = 0
        this.s = (this.radius + (Math.random() * 1))/10;
        //this.s = 12 //Math.random() * 1;
    }

    getCoordinates(){
        return {
            x: this.x,
            y: this.y
        }
    }

    randomIntFromInterval(min,max){
        return Math.floor(Math.random()*(max-min+1)+min);
    }

    render(){
        // Create arc
        let lineWidth = 0.2 + (2.8*this.random);
        let color = this.color;
        switch(this.type){
            case "full":
                this.createArcFill(this.radius, color)
                this.createArcEmpty(this.radius+lineWidth, lineWidth/2, color)
                break;
            case "fill":
                this.createArcFill(this.radius, color)
                break;
            case "empty":
                this.createArcEmpty(this.radius, lineWidth, color)
                break;
        }
    }

    createArcFill(radius, color){
        this.canvas.beginPath();
        this.canvas.arc(this.x, this.y, radius, 0, 2 * Math.PI);
        this.canvas.fillStyle = color;
        this.canvas.fill();
        this.canvas.closePath();
    }

    createArcEmpty(radius, lineWidth, color){
        this.canvas.beginPath();
        this.canvas.arc(this.x, this.y, radius, 0, 2 * Math.PI);
        this.canvas.lineWidth = lineWidth;
        this.canvas.strokeStyle = color;
        this.canvas.stroke();
        this.canvas.closePath();
    }

    move(){

        this.x += Math.cos(this.a) * this.s;
        this.y += Math.sin(this.a) * this.s;
        this.a += Math.random() * 0.4 - 0.2;

        if(this.x < 0 || this.x > this.w - this.radius){
            return false
        }

        if(this.y < 0 || this.y > this.h - this.radius){
            return false
        }
        this.render()
        return true
    }

    calculateDistance(v1, v2){
        let x = Math.abs(v1.x - v2.x);
        let y = Math.abs(v1.y - v2.y);
        return Math.sqrt((x * x) + (y * y));
    }
}

/*
 * Function to clear layer canvas
 * @num:number number of particles
 */
function popolate(num){
    for (var i = 0; i < num; i++) {
        setTimeout(
            function(x){
                return function(){
                    // Add particle
                    particles.push(new Particle(canvas))
                };
            }(i)
            ,frequency*i);
    }
    return particles.length
}

function clear(){
    // canvas.globalAlpha=0.04;
    canvas.fillStyle='#111111';
    canvas.fillRect(0, 0, tela.width, tela.height);
    // canvas.globalAlpha=1;
}

function connection(){
    let old_element = null
    $.each(particles, function(i, element){
        if(i>0){
            let box1 = old_element.getCoordinates()
            let box2 = element.getCoordinates()
            canvas.beginPath();
            canvas.moveTo(box1.x,box1.y);
            canvas.lineTo(box2.x,box2.y);
            canvas.lineWidth = 0.45;
            canvas.strokeStyle="#3f47ff";
            canvas.stroke();
            canvas.closePath();
        }

        old_element = element
    })
}

/*
 * Function to update particles in canvas
 */
function update(){
    clear();
    connection()
    particles = particles.filter(function(p) { return p.move() })
    // Recreate particles
    if(time_to_recreate){
        if(particles.length < init_num){ popolate(1);}
    }
    requestAnimationFrame(update.bind(this))
}

update();