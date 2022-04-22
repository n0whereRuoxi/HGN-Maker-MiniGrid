( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b977 - block
    b4 - block
    b457 - block
    b613 - block
    b463 - block
    b961 - block
    b245 - block
    b873 - block
    b252 - block
    b352 - block
    b349 - block
    b703 - block
    b155 - block
    b551 - block
    b820 - block
    b934 - block
    b578 - block
    b687 - block
    b184 - block
    b955 - block
    b780 - block
    b776 - block
    b83 - block
    b342 - block
    b308 - block
    b132 - block
    b429 - block
    b936 - block
    b382 - block
    b74 - block
    b169 - block
    b225 - block
    b363 - block
    b650 - block
    b811 - block
    b496 - block
    b892 - block
    b571 - block
    b65 - block
    b588 - block
    b376 - block
    b803 - block
    b224 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b977 )
    ( on b4 b977 )
    ( on b457 b4 )
    ( on b613 b457 )
    ( on b463 b613 )
    ( on b961 b463 )
    ( on b245 b961 )
    ( on b873 b245 )
    ( on b252 b873 )
    ( on b352 b252 )
    ( on b349 b352 )
    ( on b703 b349 )
    ( on b155 b703 )
    ( on b551 b155 )
    ( on b820 b551 )
    ( on b934 b820 )
    ( on b578 b934 )
    ( on b687 b578 )
    ( on b184 b687 )
    ( on b955 b184 )
    ( on b780 b955 )
    ( on b776 b780 )
    ( on b83 b776 )
    ( on b342 b83 )
    ( on b308 b342 )
    ( on b132 b308 )
    ( on b429 b132 )
    ( on b936 b429 )
    ( on b382 b936 )
    ( on b74 b382 )
    ( on b169 b74 )
    ( on b225 b169 )
    ( on b363 b225 )
    ( on b650 b363 )
    ( on b811 b650 )
    ( on b496 b811 )
    ( on b892 b496 )
    ( on b571 b892 )
    ( on b65 b571 )
    ( on b588 b65 )
    ( on b376 b588 )
    ( on b803 b376 )
    ( on b224 b803 )
    ( clear b224 )
  )
  ( :goal
    ( and
      ( clear b977 )
    )
  )
)
