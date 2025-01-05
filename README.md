# forger

Ansible based system forger

> [!IMPORTANT]
> The `master` branch can be considered to be _archived_, work on a better
> `forger` takes place on the `forger-ng` branch.

## Testing

### Environment
- Set `FORGER_SECRETS_DIR` environment variable to a directory where you
  will have the needed secrets defined.

  For example `FORGER_SECRETS_DIR=/tmp/secrets/`.

  Define those files in the secrets directory:

  - `ansible_vault.txt` - Key file for Ansible Vault.
  - `github_droptix_ssh_ed25519.txt` - Key file for personal SSH key.
  - `github_askia_ssh_ed25519.txt` - Key file for work SSH key.

  The secretes diretory will be read-only mounted in the container here:
  `/etc/forger/secrets/`.

### Using `test_image.sh`

To launch a deployment in a test container use `./scripts/test_image.sh`.

```bash
./scripts/test_image.sh fedora_41
```

To see all the available testing targets check:

```bash
./scripts/test_image.sh
```

## Notes

Somehow the automated `Lazy sync` run with Ansible is not doing it's thing. At
least not entirely. I'm still investigating this bastard as I want LSP to work
out of the box after I deployed the Ansible receipe.
