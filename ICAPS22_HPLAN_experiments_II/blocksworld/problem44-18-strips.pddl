( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b987 - block
    b251 - block
    b755 - block
    b831 - block
    b401 - block
    b907 - block
    b111 - block
    b505 - block
    b146 - block
    b399 - block
    b830 - block
    b881 - block
    b100 - block
    b379 - block
    b386 - block
    b679 - block
    b248 - block
    b899 - block
    b670 - block
    b919 - block
    b802 - block
    b767 - block
    b45 - block
    b339 - block
    b727 - block
    b162 - block
    b96 - block
    b245 - block
    b40 - block
    b823 - block
    b191 - block
    b16 - block
    b417 - block
    b114 - block
    b120 - block
    b495 - block
    b499 - block
    b544 - block
    b803 - block
    b652 - block
    b21 - block
    b240 - block
    b99 - block
    b193 - block
    b691 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b987 )
    ( on b251 b987 )
    ( on b755 b251 )
    ( on b831 b755 )
    ( on b401 b831 )
    ( on b907 b401 )
    ( on b111 b907 )
    ( on b505 b111 )
    ( on b146 b505 )
    ( on b399 b146 )
    ( on b830 b399 )
    ( on b881 b830 )
    ( on b100 b881 )
    ( on b379 b100 )
    ( on b386 b379 )
    ( on b679 b386 )
    ( on b248 b679 )
    ( on b899 b248 )
    ( on b670 b899 )
    ( on b919 b670 )
    ( on b802 b919 )
    ( on b767 b802 )
    ( on b45 b767 )
    ( on b339 b45 )
    ( on b727 b339 )
    ( on b162 b727 )
    ( on b96 b162 )
    ( on b245 b96 )
    ( on b40 b245 )
    ( on b823 b40 )
    ( on b191 b823 )
    ( on b16 b191 )
    ( on b417 b16 )
    ( on b114 b417 )
    ( on b120 b114 )
    ( on b495 b120 )
    ( on b499 b495 )
    ( on b544 b499 )
    ( on b803 b544 )
    ( on b652 b803 )
    ( on b21 b652 )
    ( on b240 b21 )
    ( on b99 b240 )
    ( on b193 b99 )
    ( on b691 b193 )
    ( clear b691 )
  )
  ( :goal
    ( and
      ( clear b987 )
    )
  )
)
