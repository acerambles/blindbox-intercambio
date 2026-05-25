const marcas = [
  "Pop Mart", "Sonny Angel", "Tokidoki", 
  "52Toys", "Miniso", "Kidrobot", "Mighty Jaxx"
];

const modelos = {
  "Pop Mart": [
    "The Monsters (Labubu)", "Molly", "Skullpanda", "Dimoo", 
    "Crybaby", "Hirono", "Hacipupu", "Pucky", "Twinkle Twinkle",
    "Zsiga", "Peach Riot", "Kubo", "Sweet Bean", "Pino Jelly",
    "Polar", "Nyota", "Azura", "1001Moons", "Kenneth", "Chaka"
  ],
  "Sonny Angel": ["Mini Figure Series", "Hug Series"],
  "Tokidoki": ["Unicorno", "Moofia", "Sandy"],
  "52Toys": ["Farmer Bob", "Carrot Street"],
  "Miniso": ["Disney", "Sanrio", "One Piece"],
  "Kidrobot": ["Dunny", "Munny"],
  "Mighty Jaxx": []
};

const series = {
  "The Monsters (Labubu)": [
    "Forest Concert Series", "Exciting Macaron Series",
    "Fall in Wild Series", "Have a Seat Series",
    "Big Into Energy Series", "Lazy Yoga Series",
    "Wacky Mart Series", "Almost Hidden Series"
  ],
  "Skullpanda": [
    "Ancient Castle Series", "The Sound Series",
    "Warmth Series", "The Paradox Series",
    "Everyday Wonderland Series", "City of Night Series",
    "Tell Me What You Want Series", "Winter Symphony Series"
  ],
  "Dimoo": [
    "Space Travel Series", "Zodiac Series",
    "Forest Night Series", "Aquarium Series",
    "Cat Paradise Series", "Retro Series",
    "By Your Side Series", "Animal Kingdom Series"
  ],
  "Molly": [
    "Flower Dreaming Series", "Starlight Glow Series",
    "Carb-Lover Series", "My Childhood Series",
    "Cooking Series", "Imaginary Wandering Series"
  ],
  "Crybaby": [
    "Sad Club Series", "Crying in the Woods Series",
    "Crying Parade Series", "Shiny Shiny Series",
    "Wild but Cutie Series", "Crying for Love Series"
  ],
  "Hirono": [
    "Little Mischief Series", "Shelter Series",
    "The Other One Series", "Echo Series",
    "Reshape Series", "Tamed Wildgrass Series"
  ]
};

// ── Cargar marcas ──
function cargarMarcas() {
  const select = document.getElementById("select-marca");
  if (!select) return;
  
  marcas.forEach(function(marca) {
    const opcion = document.createElement("option");
    opcion.value = marca;
    opcion.textContent = marca;
    select.appendChild(opcion);
  });
  const nueva = document.createElement("option");
  nueva.value = "nueva";
  nueva.textContent = "Añadir nueva marca...";
  select.appendChild(nueva);
}

// ── Cargar modelos según marca ──
function cargarModelos() {
  const marca = document.getElementById("select-marca").value;
  const selectModelo = document.getElementById("select-modelo");
  const selectSerie = document.getElementById("select-serie");

  selectModelo.innerHTML = '<option value="">Seleccionar...</option>';
  selectSerie.innerHTML = '<option value="">Seleccionar...</option>';
  document.getElementById("nuevo-modelo").style.display = "none";
  document.getElementById("nueva-serie").style.display = "none";

  if (marca === "nueva") {
    document.getElementById("nueva-marca").style.display = "block";
    return;
  }
  document.getElementById("nueva-marca").style.display = "none";

  if (modelos[marca]) {
    modelos[marca].forEach(function(modelo) {
      const opcion = document.createElement("option");
      opcion.value = modelo;
      opcion.textContent = modelo;
      selectModelo.appendChild(opcion);
    });
  }
  const nueva = document.createElement("option");
  nueva.value = "nuevo";
  nueva.textContent = "Añadir nuevo modelo...";
  selectModelo.appendChild(nueva);
}

// ── Cargar series según modelo ──
function cargarSeries() {
  const modelo = document.getElementById("select-modelo").value;
  const selectSerie = document.getElementById("select-serie");

  selectSerie.innerHTML = '<option value="">Seleccionar...</option>';
  document.getElementById("nueva-serie").style.display = "none";

  if (modelo === "nuevo") {
    document.getElementById("nuevo-modelo").style.display = "block";
    return;
  }
  document.getElementById("nuevo-modelo").style.display = "none";

  if (series[modelo]) {
    series[modelo].forEach(function(serie) {
      const opcion = document.createElement("option");
      opcion.value = serie;
      opcion.textContent = serie;
      selectSerie.appendChild(opcion);
    });
  }
  const nueva = document.createElement("option");
  nueva.value = "nueva";
  nueva.textContent = "Añadir nueva serie...";
  selectSerie.appendChild(nueva);
}

// ── Mostrar campo nueva serie ──
function comprobarSerie() {
  const serie = document.getElementById("select-serie").value;
  const inputNuevaSerie = document.getElementById("nueva-serie");
  if (serie === "nueva") {
      inputNuevaSerie.style.display = "block";
  } else {
      inputNuevaSerie.style.display = "none";
  }
}

window.onload = cargarMarcas;

function selTipo(el, valor) {
  document.querySelectorAll('.tipo-opt').forEach(function(opt) {
    opt.classList.remove('tipo-activo');
  });
  el.classList.add('tipo-activo');
  el.querySelector('input[type="radio"]').checked = true;
}