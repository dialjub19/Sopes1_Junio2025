// Inclusión de encabezados necesarios para módulos del kernel
#include <linux/init.h>          // Macros de inicialización (__init) y finalización (__exit)
#include <linux/module.h>        // Funcionalidad básica de módulos (printk, macros, etc.)
#include <linux/proc_fs.h>       // Para crear archivos en el sistema /proc
#include <linux/seq_file.h>      // API para manejar archivos /proc secuenciales
#include <linux/jiffies.h>       // Para acceder a la variable global 'jiffies'

// Función que se invoca cuando se lee el archivo /proc/mi_info
// Imprime el valor actual de jiffies (tiempo en ticks desde que se encendió el sistema)
static int mostrar_info(struct seq_file *m, void *v) {
    seq_printf(m, "Jiffies: %lu\n", jiffies);  // Escribe el valor de jiffies al archivo
    return 0;
}

// Función que se llama al abrir el archivo /proc/mi_info
// Prepara la lectura secuencial usando la función mostrar_info()
static int abrir(struct inode *inode, struct file *file) {
    return single_open(file, mostrar_info, NULL);  // Conecta la función mostrar_info con la apertura del archivo
}

// Estructura con las operaciones que define cómo se comporta el archivo /proc/mi_info

static const struct proc_ops ops = {
    .proc_open = abrir,			// Función que se llama al abrir el archivo
    .proc_read = seq_read,		// Función de lectura (secuencial)
    .proc_release = single_release 	// Función que se llama al cerrar el archivo
};

// Función de inicialización del módulo (se ejecuta cuando se carga con insmod)
static int __init inicio(void) {
    // Crea el archivo /proc/mi_info sin permisos especiales y con las operaciones definidas en 'ops'
    proc_create("timpoa_arranque", 0, NULL, &ops);
    printk(KERN_INFO "Modulo cargado\n");  // Mensaje en el log del kernel
    return 0;  // Indica que se cargó correctamente
}

// Función de salida del módulo (se ejecuta cuando se descarga con rmmod)
static void __exit salida(void) {
    remove_proc_entry("timpo_arranque", NULL);   // Elimina el archivo /proc/mi_info
    printk(KERN_INFO "Módulo descargado\n");  // Mensaje en el log del kernel
}

// Macros que indican al kernel qué funciones usar al cargar y descargar el módulo
module_init(inicio);
module_exit(salida);

/*  
    El modulo debe tener una licencia, una descripcion y un autor.
*/
MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("Módulo para leer el tiempo de arranque del sistema");
MODULE_AUTHOR("Juarez");
