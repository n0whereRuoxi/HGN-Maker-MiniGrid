( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b21 - block
    b600 - block
    b704 - block
    b788 - block
    b81 - block
    b245 - block
    b11 - block
    b174 - block
    b32 - block
    b867 - block
    b586 - block
    b729 - block
    b250 - block
    b945 - block
    b6 - block
    b381 - block
    b757 - block
    b989 - block
    b370 - block
    b218 - block
    b330 - block
    b631 - block
    b907 - block
    b337 - block
    b307 - block
    b433 - block
    b422 - block
    b991 - block
    b520 - block
    b67 - block
    b672 - block
    b164 - block
    b767 - block
    b362 - block
    b449 - block
    b76 - block
    b597 - block
    b710 - block
    b461 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b21 )
    ( on b600 b21 )
    ( on b704 b600 )
    ( on b788 b704 )
    ( on b81 b788 )
    ( on b245 b81 )
    ( on b11 b245 )
    ( on b174 b11 )
    ( on b32 b174 )
    ( on b867 b32 )
    ( on b586 b867 )
    ( on b729 b586 )
    ( on b250 b729 )
    ( on b945 b250 )
    ( on b6 b945 )
    ( on b381 b6 )
    ( on b757 b381 )
    ( on b989 b757 )
    ( on b370 b989 )
    ( on b218 b370 )
    ( on b330 b218 )
    ( on b631 b330 )
    ( on b907 b631 )
    ( on b337 b907 )
    ( on b307 b337 )
    ( on b433 b307 )
    ( on b422 b433 )
    ( on b991 b422 )
    ( on b520 b991 )
    ( on b67 b520 )
    ( on b672 b67 )
    ( on b164 b672 )
    ( on b767 b164 )
    ( on b362 b767 )
    ( on b449 b362 )
    ( on b76 b449 )
    ( on b597 b76 )
    ( on b710 b597 )
    ( on b461 b710 )
    ( clear b461 )
  )
  ( :goal
    ( and
      ( clear b21 )
    )
  )
)
