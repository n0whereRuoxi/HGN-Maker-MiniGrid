( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b6 - block
    b87 - block
    b685 - block
    b8 - block
    b1 - block
    b195 - block
    b791 - block
    b803 - block
    b686 - block
    b616 - block
    b240 - block
    b776 - block
    b507 - block
    b381 - block
    b288 - block
    b626 - block
    b89 - block
    b603 - block
    b658 - block
    b896 - block
    b268 - block
    b106 - block
    b76 - block
    b243 - block
    b751 - block
    b583 - block
    b530 - block
    b705 - block
    b228 - block
    b671 - block
    b963 - block
    b7 - block
    b629 - block
    b812 - block
    b989 - block
    b491 - block
    b425 - block
    b108 - block
    b498 - block
    b702 - block
    b280 - block
    b716 - block
    b327 - block
    b934 - block
    b621 - block
    b664 - block
    b159 - block
    b612 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b6 )
    ( on b87 b6 )
    ( on b685 b87 )
    ( on b8 b685 )
    ( on b1 b8 )
    ( on b195 b1 )
    ( on b791 b195 )
    ( on b803 b791 )
    ( on b686 b803 )
    ( on b616 b686 )
    ( on b240 b616 )
    ( on b776 b240 )
    ( on b507 b776 )
    ( on b381 b507 )
    ( on b288 b381 )
    ( on b626 b288 )
    ( on b89 b626 )
    ( on b603 b89 )
    ( on b658 b603 )
    ( on b896 b658 )
    ( on b268 b896 )
    ( on b106 b268 )
    ( on b76 b106 )
    ( on b243 b76 )
    ( on b751 b243 )
    ( on b583 b751 )
    ( on b530 b583 )
    ( on b705 b530 )
    ( on b228 b705 )
    ( on b671 b228 )
    ( on b963 b671 )
    ( on b7 b963 )
    ( on b629 b7 )
    ( on b812 b629 )
    ( on b989 b812 )
    ( on b491 b989 )
    ( on b425 b491 )
    ( on b108 b425 )
    ( on b498 b108 )
    ( on b702 b498 )
    ( on b280 b702 )
    ( on b716 b280 )
    ( on b327 b716 )
    ( on b934 b327 )
    ( on b621 b934 )
    ( on b664 b621 )
    ( on b159 b664 )
    ( on b612 b159 )
    ( clear b612 )
  )
  ( :goal
    ( and
      ( clear b6 )
    )
  )
)
