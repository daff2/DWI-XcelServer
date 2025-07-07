package DAO;

import conexion.conexion;
import java.sql.*;
import java.util.*;
import modelo.Producto;


public class ProductoDAO {

    public List<Producto> listarProductos() {
        List<Producto> lista = new ArrayList<>();
        String sql = "SELECT * FROM productos";

        try (Connection con = conexion.conectar();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Producto p = new Producto();
                p.setId(rs.getInt("ID"));
                p.setNombre(rs.getString("NOMBRE"));
                p.setDescripcion(rs.getString("DESCRIPCION"));
                p.setPrecio(rs.getDouble("PRECIO"));
                p.setStock(rs.getInt("STOCK"));
                p.setImagen(rs.getString("IMAGEN"));
                p.setCategoriaId(rs.getInt("CATEGORIA_ID"));
                lista.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return lista;
    }

    public List<Producto> listarPorCategoria(int categoriaId) {
        List<Producto> lista = new ArrayList<>();
        String sql = "SELECT * FROM productos WHERE CATEGORIA_ID = ?";

        try (Connection con = conexion.conectar();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, categoriaId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Producto p = new Producto();
                p.setId(rs.getInt("ID"));
                p.setNombre(rs.getString("NOMBRE"));
                p.setDescripcion(rs.getString("DESCRIPCION"));
                p.setPrecio(rs.getDouble("PRECIO"));
                p.setStock(rs.getInt("STOCK"));
                p.setImagen(rs.getString("IMAGEN"));
                p.setCategoriaId(rs.getInt("CATEGORIA_ID"));
                lista.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return lista;
    }

    public Producto obtenerPorId(int id) {
        Producto p = null;
        String sql = "SELECT * FROM productos WHERE ID = ?";
        try (Connection con = conexion.conectar();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                p = new Producto();
                p.setId(rs.getInt("ID"));
                p.setNombre(rs.getString("NOMBRE"));
                p.setDescripcion(rs.getString("DESCRIPCION"));
                p.setPrecio(rs.getDouble("PRECIO"));
                p.setStock(rs.getInt("STOCK"));
                p.setImagen(rs.getString("IMAGEN"));
                p.setCategoriaId(rs.getInt("CATEGORIA_ID"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return p;
    }
}
