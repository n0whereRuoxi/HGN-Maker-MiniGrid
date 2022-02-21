( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b253 - block
    b211 - block
    b703 - block
    b970 - block
    b605 - block
    b330 - block
    b49 - block
    b113 - block
    b940 - block
    b522 - block
    b199 - block
    b110 - block
    b665 - block
    b912 - block
    b899 - block
    b835 - block
    b516 - block
    b870 - block
    b834 - block
    b167 - block
    b208 - block
    b888 - block
    b607 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b253 )
    ( on b211 b253 )
    ( on b703 b211 )
    ( on b970 b703 )
    ( on b605 b970 )
    ( on b330 b605 )
    ( on b49 b330 )
    ( on b113 b49 )
    ( on b940 b113 )
    ( on b522 b940 )
    ( on b199 b522 )
    ( on b110 b199 )
    ( on b665 b110 )
    ( on b912 b665 )
    ( on b899 b912 )
    ( on b835 b899 )
    ( on b516 b835 )
    ( on b870 b516 )
    ( on b834 b870 )
    ( on b167 b834 )
    ( on b208 b167 )
    ( on b888 b208 )
    ( on b607 b888 )
    ( clear b607 )
  )
  ( :goal
    ( and
      ( clear b253 )
    )
  )
)
