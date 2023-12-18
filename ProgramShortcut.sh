#!/bin/bash

while true;
    do
        # Menampilkan menu beberapa perintah]
        echo "──────────────────────────────────────"
        echo "| Selamat datang di program shortcut |"
        echo "──────────────────────────────────────"
        echo "| 1.  Buka Firefox                   |"
        echo "| 2.  Buat Folder                    |"
        echo "| 3.  Buat File                      |"
        echo "| 4.  Baca File                      |"
        echo "| 5.  Manipulasi Hak Akses Berkas    |"
        echo "| 6.  Rename Berkas                  |"
        echo "| 7.  Hapus Berkas                   |"
        echo "| 8.  Eksekusi File Bash             |"
        echo "| 9.  Eksekusi File Python           |"
        echo "| 10. Eksekusi File C++              |"
        echo "| 11. Tampilkan Informasi Sistem     |"
        echo "| 12. Update Package OS              |"
        echo "| 13. Upgrade Package OS             |"
        echo "| 14. Buat User Baru                 |"
        echo "| 15. Switch User                    |"
        echo "| 16. Rename Username User           |"
        echo "| 17. Ubah Password User             |"
        echo "| 18. Buat Group                     |"
        echo "| 19. Masukkan User ke Group         |"
        echo "| 20. Keluar Program                 |"
        echo "──────────────────────────────────────"

        # Membaca pilihan pengguna
        read -p "Pilih nomor menu (1-20): " choice

        # Menangani pilihan pengguna
        case $choice in

            # Perintah membuka Firefox
            1)
                echo "Membuka Firefox..."
                firefox &
                ;;

            # Perintah membuat folder
            2)
                read -p "Masukkan nama folder yang akan dibuat: " folder_name
                mkdir "$folder_name"
                echo "Folder \"$folder_name\" berhasil dibuat."
                ;;

            # Perintah membuat file
            3)
                read -p "Masukkan nama file yang akan dibuat: " file_name
                touch "$file_name"
                echo "File \"$file_name\" berhasil dibuat."
                ;;

            # Perintah membaca file
            4)
                read -p "Masukkan nama file yang akan dibaca: " read_file
                cat "$read_file"
                ;;

            # Perintah memanipulasi hak akses berkas
            5)
                read -p "Masukkan nama berkas untuk manipulasi hak akses: " file_to_modify
                read -p "Masukkan hak akses baru (contoh: 755): " new_permissions
                chmod "$new_permissions" "$file_to_modify"
                echo "Hak akses untuk \"$file_to_modify\" berhasil diubah menjadi $new_permissions."
                ;;

            # Perintah rename berkas
            6)
                read -p "Masukkan nama berkas yang akan direname: " old_name
                read -p "Masukkan nama baru: " new_name
                mv "$old_name" "$new_name"
                echo "Berkas \"$old_name\" berhasil direname menjadi \"$new_name\"."
                ;;

            # Perintah menghapus berkas
            7)
                read -p "Masukkan nama berkas yang akan dihapus: " file_to_delete
                rm "$file_to_delete"
                echo "Berkas \"$file_to_delete\" berhasil dihapus."
                ;;

            # Perintah mengeksekusi file program bash
            8)
                read -p "Masukkan nama file bash yang akan dieksekusi: " bash_file
                bash "$bash_file"
                ;;

            # Perintah mengeksekusi file program python
            9)
                read -p "Masukkan nama file Python yang akan dieksekusi: " python_file
                python3 "$python_file"
                ;;

            # Perintah mengeksekusi file program c++
            10)
                read -p "Masukkan nama file C++ yang akan dikompilasi dan dieksekusi: " cpp_file
                g++ "$cpp_file" -o "${cpp_file%.cpp}" && "./${cpp_file%.cpp}"
                ;;

            # Perintah menampilkan informasi sistem
            11)
                echo "Tampilkan Informasi Sistem:"
                uname -a
                ;;

            # Perintah mengupdate package OS
            12)
                echo "Update Package OS..."
                sudo apt update
                ;;

            # Perintah mengupgrade package OS
            13)
                echo "Upgrade Package OS..."
                sudo apt upgrade -y
                ;;

            # Perintah membuat user baru
            14)
                read -p "Masukkan nama pengguna baru yang akan dibuat: " new_username
                sudo adduser "$new_username"
                ;;

            # Perintah switch user
            15)
                read -p "Masukkan nama pengguna untuk switch: " switch_user
                su - "$switch_user"
                ;;

            # Perintah rename username user
            16)
                read -p "Masukkan nama pengguna yang akan direname: " old_username
                read -p "Masukkan nama baru: " new_username
                sudo usermod -l "$new_username" "$old_username"
                ;;

            # Perintah mengubah password user
            17)
                read -p "Masukkan nama pengguna untuk mengubah password: " username_password
                sudo passwd "$username_password"
                ;;

            # Perintah membuat group baru
            18)
                read -p "Masukkan nama grup yang akan dibuat: " group_name
                sudo addgroup "$group_name"
                ;;

            # Perintah memasukkan user ke group
            19)
                read -p "Masukkan nama pengguna: " user_to_add
                read -p "Masukkan nama grup: " group_to_add
                sudo adduser "$user_to_add" "$group_to_add"
                ;;

            # Perintah keluar program
            20)
                echo "Keluar Program..."
                exit 0
                ;;

            # Pesan error jika inputan user tidak valid atau tidak sesuai pilihan menu
            *)
                echo "Pilihan tidak valid. Masukkan nomor menu antara 1-20."
                ;;
        esac

        # Menunggu pengguna menekan Enter sebelum menampilkan kembali menu
        read -p "Tekan Enter untuk melanjutkan..."
        clear
    done
