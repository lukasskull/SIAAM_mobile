/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package views;

import inc.config;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import javax.swing.JOptionPane;

/**
 *
 * @author LUKAS PUTRA DIANTAMA
 */
public class login extends javax.swing.JFrame {
    Connection conn;
    Statement st;
    ResultSet rs;
    
    public static int id;
    
    private void login(){
        String cekUname = tUname.getText();
        String cekPass = tPass.getText();
        
        if(cekUname.equals("")&&cekPass.equals("")){
            JOptionPane.showMessageDialog(null, "Username dan Password Tidak Boleh Kosong!");
            JOptionPane.showMessageDialog(null, "Gagal Login!");
        }
        else if(cekUname.equals("")){
            JOptionPane.showMessageDialog(null, "Username Tidak Boleh Kosong!");
            JOptionPane.showMessageDialog(null, "Gagal Login!");
        }else if(cekPass.equals("")){
            JOptionPane.showMessageDialog(null, "Password Tidak Boleh Kosong!");
            JOptionPane.showMessageDialog(null, "Gagal Login!");
        }else {
              try{
                String uname = tUname.getText(); 
                String pass  = tPass.getText();
                
                String sql = "SELECT * FROM sys_karyawan JOIN sys_password ON sys_karyawan.karyawan_id = sys_password.password_id WHERE karyawan_username = '"+uname+"' AND password_value = md5('"+pass+"')";

                conn = config.Conn();
                st = conn.createStatement();
                rs = st.executeQuery(sql);



                if(rs.next()){
                    JOptionPane.showMessageDialog(null,"Selamat, Login Berhasil!");
                    id = rs.getInt("karyawan_id");

                    switch (rs.getInt("karyawan_role_id")) {
                        case 1:
                            JOptionPane.showMessageDialog(null,"Halaman Owner Belum Jadi");
                            break;
                        case 2:
                            admin a = new admin();
                            a.show();
                            break;
                        case 3:
                            JOptionPane.showMessageDialog(null,"Halaman Kepala Gudang Belum Jadi");
                            break;
                        case 4:
                            JOptionPane.showMessageDialog(null,"Halaman Apoteker Belum Jadi");
                            break;
                        default:
                            JOptionPane.showMessageDialog(null,"Halaman Kasir Belum Jadi");
                            break;
                    }
                }else{
                     JOptionPane.showMessageDialog(null,"Maaf Data Anda Tidak Ditemukan, Silahkan Hubungi Admin Untuk Konfirmasi Lebih Lanjut!");
                     clearText();
                }

            }catch(Exception e){
                System.out.println(e.getMessage());
            }
        }
      
    }
    private void clearText(){
        tUname.setText("");
        tPass.setText("");
     }
    
    public static int getId(){
        return id;
    }
    /**
     * Creates new form login
     */
    public login() {
        initComponents();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        tUname = new javax.swing.JTextField();
        bLogin = new javax.swing.JButton();
        bBatal = new javax.swing.JButton();
        tPass = new javax.swing.JPasswordField();
        jLabel4 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jLabel1.setFont(new java.awt.Font("Arial Black", 0, 18)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(51, 153, 0));
        jLabel1.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel1.setText("Selamat Datang Di SIAAM");

        jLabel2.setText("Username");

        jLabel3.setText("Password");

        bLogin.setText("Login");
        bLogin.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                bLoginActionPerformed(evt);
            }
        });

        bBatal.setText("Reset");
        bBatal.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                bBatalActionPerformed(evt);
            }
        });

        tPass.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                tPassActionPerformed(evt);
            }
        });

        jLabel4.setIcon(new javax.swing.ImageIcon("F:\\Latihan Coding\\Latihan Flutter\\p3l\\siaam\\img\\atma_medika.png")); // NOI18N

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addContainerGap())
                    .addGroup(layout.createSequentialGroup()
                        .addGap(0, 18, Short.MAX_VALUE)
                        .addComponent(jLabel4)
                        .addGap(18, 18, 18)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jLabel2)
                                    .addComponent(jLabel3))
                                .addGap(42, 42, 42)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                    .addComponent(tUname)
                                    .addComponent(tPass, javax.swing.GroupLayout.DEFAULT_SIZE, 124, Short.MAX_VALUE))
                                .addGap(104, 104, 104))
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                                .addComponent(bLogin)
                                .addGap(48, 48, 48)
                                .addComponent(bBatal)
                                .addGap(132, 132, 132))))))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(23, 23, 23)
                .addComponent(jLabel1)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(54, 54, 54)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(tUname, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel2))
                        .addGap(18, 18, 18)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel3)
                            .addComponent(tPass, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(31, 31, 31)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(bLogin)
                            .addComponent(bBatal)))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(34, 34, 34)
                        .addComponent(jLabel4)))
                .addContainerGap(46, Short.MAX_VALUE))
        );

        setSize(new java.awt.Dimension(568, 352));
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    private void bLoginActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_bLoginActionPerformed
        // TODO add your handling code here:
        login();
    }//GEN-LAST:event_bLoginActionPerformed

    private void bBatalActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_bBatalActionPerformed
        // TODO add your handling code here:
        clearText();
    }//GEN-LAST:event_bBatalActionPerformed

    private void tPassActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_tPassActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_tPassActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(login.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(login.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(login.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(login.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new login().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton bBatal;
    private javax.swing.JButton bLogin;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JPasswordField tPass;
    private javax.swing.JTextField tUname;
    // End of variables declaration//GEN-END:variables
}
