( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b526 - block
    b796 - block
    b300 - block
    b837 - block
    b959 - block
    b45 - block
    b669 - block
    b487 - block
    b880 - block
    b711 - block
    b873 - block
    b344 - block
    b50 - block
    b692 - block
    b325 - block
    b628 - block
    b310 - block
    b534 - block
    b863 - block
    b916 - block
    b624 - block
    b657 - block
    b253 - block
    b981 - block
    b118 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b526 )
    ( on b796 b526 )
    ( on b300 b796 )
    ( on b837 b300 )
    ( on b959 b837 )
    ( on b45 b959 )
    ( on b669 b45 )
    ( on b487 b669 )
    ( on b880 b487 )
    ( on b711 b880 )
    ( on b873 b711 )
    ( on b344 b873 )
    ( on b50 b344 )
    ( on b692 b50 )
    ( on b325 b692 )
    ( on b628 b325 )
    ( on b310 b628 )
    ( on b534 b310 )
    ( on b863 b534 )
    ( on b916 b863 )
    ( on b624 b916 )
    ( on b657 b624 )
    ( on b253 b657 )
    ( on b981 b253 )
    ( on b118 b981 )
    ( clear b118 )
  )
  ( :tasks
    ( Make-24Pile b796 b300 b837 b959 b45 b669 b487 b880 b711 b873 b344 b50 b692 b325 b628 b310 b534 b863 b916 b624 b657 b253 b981 b118 )
  )
)
