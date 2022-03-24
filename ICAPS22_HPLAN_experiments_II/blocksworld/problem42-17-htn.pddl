( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b245 - block
    b887 - block
    b646 - block
    b732 - block
    b233 - block
    b724 - block
    b38 - block
    b500 - block
    b552 - block
    b76 - block
    b786 - block
    b167 - block
    b896 - block
    b668 - block
    b952 - block
    b499 - block
    b114 - block
    b652 - block
    b830 - block
    b165 - block
    b97 - block
    b309 - block
    b329 - block
    b189 - block
    b363 - block
    b910 - block
    b748 - block
    b108 - block
    b730 - block
    b61 - block
    b68 - block
    b875 - block
    b888 - block
    b962 - block
    b269 - block
    b586 - block
    b96 - block
    b503 - block
    b327 - block
    b548 - block
    b505 - block
    b823 - block
    b555 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b245 )
    ( on b887 b245 )
    ( on b646 b887 )
    ( on b732 b646 )
    ( on b233 b732 )
    ( on b724 b233 )
    ( on b38 b724 )
    ( on b500 b38 )
    ( on b552 b500 )
    ( on b76 b552 )
    ( on b786 b76 )
    ( on b167 b786 )
    ( on b896 b167 )
    ( on b668 b896 )
    ( on b952 b668 )
    ( on b499 b952 )
    ( on b114 b499 )
    ( on b652 b114 )
    ( on b830 b652 )
    ( on b165 b830 )
    ( on b97 b165 )
    ( on b309 b97 )
    ( on b329 b309 )
    ( on b189 b329 )
    ( on b363 b189 )
    ( on b910 b363 )
    ( on b748 b910 )
    ( on b108 b748 )
    ( on b730 b108 )
    ( on b61 b730 )
    ( on b68 b61 )
    ( on b875 b68 )
    ( on b888 b875 )
    ( on b962 b888 )
    ( on b269 b962 )
    ( on b586 b269 )
    ( on b96 b586 )
    ( on b503 b96 )
    ( on b327 b503 )
    ( on b548 b327 )
    ( on b505 b548 )
    ( on b823 b505 )
    ( on b555 b823 )
    ( clear b555 )
  )
  ( :tasks
    ( Make-42Pile b887 b646 b732 b233 b724 b38 b500 b552 b76 b786 b167 b896 b668 b952 b499 b114 b652 b830 b165 b97 b309 b329 b189 b363 b910 b748 b108 b730 b61 b68 b875 b888 b962 b269 b586 b96 b503 b327 b548 b505 b823 b555 )
  )
)
