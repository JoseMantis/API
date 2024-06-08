namespace AplicacionCliente.Models
{
    //Clase de clientes. Contiene Nombre, Dirección Rut y ID.
    public class Clientes
    {
        public int Id { get; set; }
        public string? RazonSocial { get; set; }
        public string Direccion {get; set; }
        public string? Rut { get; set; }
    }
}
