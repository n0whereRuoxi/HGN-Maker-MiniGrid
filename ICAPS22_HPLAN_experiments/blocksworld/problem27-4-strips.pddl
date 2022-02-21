( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b492 - block
    b220 - block
    b776 - block
    b606 - block
    b848 - block
    b542 - block
    b556 - block
    b445 - block
    b403 - block
    b269 - block
    b978 - block
    b505 - block
    b68 - block
    b388 - block
    b530 - block
    b566 - block
    b203 - block
    b264 - block
    b814 - block
    b104 - block
    b191 - block
    b410 - block
    b711 - block
    b783 - block
    b27 - block
    b589 - block
    b880 - block
    b141 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b492 )
    ( on b220 b492 )
    ( on b776 b220 )
    ( on b606 b776 )
    ( on b848 b606 )
    ( on b542 b848 )
    ( on b556 b542 )
    ( on b445 b556 )
    ( on b403 b445 )
    ( on b269 b403 )
    ( on b978 b269 )
    ( on b505 b978 )
    ( on b68 b505 )
    ( on b388 b68 )
    ( on b530 b388 )
    ( on b566 b530 )
    ( on b203 b566 )
    ( on b264 b203 )
    ( on b814 b264 )
    ( on b104 b814 )
    ( on b191 b104 )
    ( on b410 b191 )
    ( on b711 b410 )
    ( on b783 b711 )
    ( on b27 b783 )
    ( on b589 b27 )
    ( on b880 b589 )
    ( on b141 b880 )
    ( clear b141 )
  )
  ( :goal
    ( and
      ( clear b492 )
    )
  )
)
