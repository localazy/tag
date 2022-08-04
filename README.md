# Localazy Tag docker action

Manage Localazy's release tags. For full overview please [visit the documentation](https://localazy.com/docs/cli/release-tags).

## Inputs

### `workdir`

**Optional** Defines the working directory where to invoke Localazy CLI command.

### `config_file`

**Optional** The filename of the configuration file. Default: localazy.json

### `key_file`

**Optional** The filename of the key file.

### `read_key`

**Optional** The read key for the project on Localazy. Can be defined in the config or key file but we recommend to use Github Secrets. 

### `write_key`

**Optional** The write key for the project on Localazy. Can be defined in the config or key file but we recommend to use Github Secrets. 

### `list`

**Optional** List existing release tags.


### `publish`

**Optional** Publish tag.

### `promote_from`

**Optional** Promote tag's state into _promote_to_ state and overwrite it's state. `promote_to` must also be defined.

### `promote_to`

**Optional** Promotion target of the _promote_from_ tag. `promote_from` must also be defined.

### `rename_from`

**Optional** Name of the tag you want to rename. `rename_to` must also be defined.

### `rename_to`

**Optional** New name of the _rename_from_ tag. `rename_from` must also be defined.

### `delete`

**Optional** Name of the tag you want to delete.

### `merge_from`

**Optional** Merge tag's state into _merge_to_ tag. `merge_to` and `merge_output` must also be defined.

### `merge_to`

**Optional** Merge target of the _merge_from_ tag. `merge_from` and `merge_output` must also be defined.

### `merge_output`

**Optional** Name of the output tag of the merge operation. `merge_from` and `merge_output` must also be defined.

### `merge_parameters`

**Optional** Parameters for the merge operation. See available [options](https://localazy.com/docs/cli/release-tags#parameters). Invoked only when `merge_from`, `merge_to` and `merge_output` are defined.


## Example usage

```yaml
uses: localazy/tag@v1
with:
  read_key: ${{ secrets.LOCALAZY_READ_KEY }}
  write_key: ${{ secrets.LOCALAZY_WRITE_KEY }}
  merge_from: 'renamed-tag'
  merge_to: 'new-tag-2'
  merge_output: 'merged-tag'
  merge_parameters: '--no-arrays-checks'
```
