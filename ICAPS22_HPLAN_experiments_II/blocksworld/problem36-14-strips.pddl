( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b630 - block
    b709 - block
    b991 - block
    b996 - block
    b205 - block
    b764 - block
    b900 - block
    b6 - block
    b972 - block
    b350 - block
    b294 - block
    b587 - block
    b311 - block
    b595 - block
    b775 - block
    b257 - block
    b994 - block
    b282 - block
    b657 - block
    b473 - block
    b670 - block
    b776 - block
    b433 - block
    b153 - block
    b563 - block
    b183 - block
    b890 - block
    b252 - block
    b978 - block
    b577 - block
    b56 - block
    b828 - block
    b172 - block
    b126 - block
    b167 - block
    b208 - block
    b479 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b630 )
    ( on b709 b630 )
    ( on b991 b709 )
    ( on b996 b991 )
    ( on b205 b996 )
    ( on b764 b205 )
    ( on b900 b764 )
    ( on b6 b900 )
    ( on b972 b6 )
    ( on b350 b972 )
    ( on b294 b350 )
    ( on b587 b294 )
    ( on b311 b587 )
    ( on b595 b311 )
    ( on b775 b595 )
    ( on b257 b775 )
    ( on b994 b257 )
    ( on b282 b994 )
    ( on b657 b282 )
    ( on b473 b657 )
    ( on b670 b473 )
    ( on b776 b670 )
    ( on b433 b776 )
    ( on b153 b433 )
    ( on b563 b153 )
    ( on b183 b563 )
    ( on b890 b183 )
    ( on b252 b890 )
    ( on b978 b252 )
    ( on b577 b978 )
    ( on b56 b577 )
    ( on b828 b56 )
    ( on b172 b828 )
    ( on b126 b172 )
    ( on b167 b126 )
    ( on b208 b167 )
    ( on b479 b208 )
    ( clear b479 )
  )
  ( :goal
    ( and
      ( clear b630 )
    )
  )
)
