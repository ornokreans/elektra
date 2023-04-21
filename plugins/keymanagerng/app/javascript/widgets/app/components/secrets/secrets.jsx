import React, { useState, useEffect } from "react"
import SecretList from "./secretList"
import Pagination from "../Pagination"
import { getSecrets } from "../../secretActions"
import { useQuery } from "@tanstack/react-query"
import {
  Container,
  IntroBox,
  SearchInput,
  DataGridToolbar,
  ButtonRow,
  Button,
  Stack,
  Spinner,
} from "juno-ui-components"
import { Link } from "react-router-dom"
import { useMessageStore } from "messages-provider"
import { parseError } from "../../helpers"
import useSecretsSearch from "../../hooks/useSecretsSearch"

const ITEMS_PER_PAGE = 20

const Secrets = () => {
  const addMessage = useMessageStore((state) => state.addMessage)
  const [currentPage, setCurrentPage] = useState(1)
  const [isPanelOpen, setIsPanelOpen] = useState(false)
  const [isSearching, setIsSearching] = useState(false)
  const [paginationOptions, setPaginationOptions] = useState({
    limit: ITEMS_PER_PAGE,
    offset: 0,
  })

  const { isLoading, isFetching, data, error } = useQuery(
    ["secrets", paginationOptions],
    getSecrets,
    {}
  )

  const search = useSecretsSearch()

  // dispatch error with useEffect because error variable will first set once all retries did not succeed
  useEffect(() => {
    if (error) {
      addMessage({
        variant: "error",
        text: parseError(error),
      })
    }
  }, [error])

  const onPaginationChanged = (page) => {
    // todo check if page < 0
    setCurrentPage(page)
    const newOffset = (page - 1) * ITEMS_PER_PAGE
    setPaginationOptions({ ...paginationOptions, offset: newOffset })
  }

  const onSearch = (text) => {
    setIsSearching(true)
    search.searchFor(text)
  }

  const onSearchCancel = () => {
    search.cancel()
  }

  const onClear = () => {
    search.cancel()
    setIsSearching(false)
  }

  return (
    <Container py px={false}>
      <IntroBox>
        <p>
          The secrets resource is the heart of the Barbican service. It provides
          access to the secret/keying material stored in the system. Barbican
          supports the secure storage of data for various content types. For
          more information, visit the&nbsp;
          <a href="http://developer.openstack.org/api-guide/key-manager/secrets.html">
            Barbican OpenStack documentation.
          </a>
        </p>
      </IntroBox>

      <DataGridToolbar
        search={
          <Stack alignment="center">
            <SearchInput onSearch={onSearch} onClear={onClear} />
            {search.isFetching && (
              <>
                <Button
                  icon="cancel"
                  label="Cancel"
                  onClick={onSearchCancel}
                  variant="primary-danger"
                  size="small"
                />
                <Spinner variant="primary" />
              </>
            )}
          </Stack>
        }
      >
        <ButtonRow>
          <Link to="/secrets/newSecret">
            <Button>New Secret</Button>
          </Link>
        </ButtonRow>
      </DataGridToolbar>

      <SecretList
        secrets={isSearching ? search.displayResults : data?.secrets}
        isLoading={isLoading}
      />
      {!isSearching && data?.secrets?.length > 0 && (
        <Pagination
          count={data?.total}
          limit={ITEMS_PER_PAGE}
          onChanged={onPaginationChanged}
          isFetching={isFetching}
          disabled={error || data?.secrets?.length === 0}
          currentPage={currentPage}
        />
      )}
    </Container>
  )
}

export default Secrets
