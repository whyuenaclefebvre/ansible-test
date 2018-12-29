# Ansible Experimentation

This file is intented to play around `Ansible` and lists out the system command to setup a new Ubuntu machine.

---
## Run the playbook
```bash
ansible-playbook -i hosts playbook.yml --ask-become-pass
```
OR
```bash
ansible-playbook playbook.yml --ask-become-pass
```

NOTE: `--ask-become-pass` flag is necessary to run the file as sudoers