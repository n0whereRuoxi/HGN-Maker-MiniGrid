( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b443 - block
    b424 - block
    b128 - block
    b944 - block
    b392 - block
    b933 - block
    b726 - block
    b321 - block
    b265 - block
    b118 - block
    b519 - block
    b730 - block
    b545 - block
    b196 - block
    b732 - block
    b605 - block
    b621 - block
    b102 - block
    b147 - block
    b890 - block
    b906 - block
    b723 - block
    b361 - block
    b202 - block
    b721 - block
    b2 - block
    b150 - block
    b20 - block
    b504 - block
    b40 - block
    b645 - block
    b24 - block
    b429 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b443 )
    ( on b424 b443 )
    ( on b128 b424 )
    ( on b944 b128 )
    ( on b392 b944 )
    ( on b933 b392 )
    ( on b726 b933 )
    ( on b321 b726 )
    ( on b265 b321 )
    ( on b118 b265 )
    ( on b519 b118 )
    ( on b730 b519 )
    ( on b545 b730 )
    ( on b196 b545 )
    ( on b732 b196 )
    ( on b605 b732 )
    ( on b621 b605 )
    ( on b102 b621 )
    ( on b147 b102 )
    ( on b890 b147 )
    ( on b906 b890 )
    ( on b723 b906 )
    ( on b361 b723 )
    ( on b202 b361 )
    ( on b721 b202 )
    ( on b2 b721 )
    ( on b150 b2 )
    ( on b20 b150 )
    ( on b504 b20 )
    ( on b40 b504 )
    ( on b645 b40 )
    ( on b24 b645 )
    ( on b429 b24 )
    ( clear b429 )
  )
  ( :goal
    ( and
      ( clear b443 )
    )
  )
)
