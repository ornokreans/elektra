import React, { useCallback, useRef } from "react"
import { deleteSecret } from "../../secretActions"
import { Link, useHistory } from "react-router-dom"
import { policy } from "lib/policy"
import {
  Badge,
  ButtonRow,
  Icon,
  DataGridRow,
  DataGridCell,
  Message,
  Checkbox,
} from "juno-ui-components"
import { getSecretUuid } from "../../../lib/secretHelper"
import { useMutation, useQueryClient } from "@tanstack/react-query"
import HintLoading from "../HintLoading"

const SecretListItem = ({ secret, hideAction }) => {
  // manually push a path onto the react router history
  // once we run on react-router-dom v6 this should be replaced with the useNavigate hook, and the push function with a navigate function
  // like this: const navigate = useNavigate(), the use navigate('this/is/the/path') in the onClick handler of the edit button below
  const { push } = useHistory()
  const secretUuid = getSecretUuid(secret)
  const queryClient = useQueryClient()

  const { isLoading, isError, error, data, isSuccess, mutate } = useMutation(
    deleteSecret,
    100,
    secretUuid
  )

  const handleDelete = () => {
    mutate(
      {
        id: secretUuid,
      },
      {
        onSuccess: () => {
          //TODO: Confirm remove modal
          queryClient.invalidateQueries("secrets")
        },
      }
    )
  }

  const handleSecretSelected = (oEvent) => {
  }


  return isLoading && !data ? (
    <HintLoading />
  ) : isError ? (
    <Message variant="danger">
      {`${error.statusCode}, ${error.message}`}
    </Message>
  ) : (
    <DataGridRow>
      {hideAction && (
        <DataGridCell>
          <Checkbox onChange={(oEvent) => handleSecretSelected(oEvent)} />
        </DataGridCell>
      )}
      <DataGridCell>
        <Link className="tw-break-all" to={`/secrets/${secretUuid}/show`}>
          {secret.name || secretUuid}
        </Link>
        <small>
        <Badge className="tw-display-inline">{secretUuid}</Badge>
        </small>
      </DataGridCell>
      <DataGridCell>{secret.secret_type}</DataGridCell>
      {!hideAction && (
        <DataGridCell>{secret?.content_types?.default}</DataGridCell>
      )}
      <DataGridCell>{secret.status}</DataGridCell>
      {!hideAction && (
        <DataGridCell nowrap>
          <ButtonRow>
            {policy.isAllowed("keymanagerng:secret_delete") && (
              <Icon
                icon="deleteForever"
                onClick={() => handleDelete(secretUuid)}
              />
            )}
          </ButtonRow>
        </DataGridCell>
      )}
    </DataGridRow>
  )
}

export default SecretListItem
