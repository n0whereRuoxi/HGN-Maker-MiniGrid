( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b352 - block
    b618 - block
    b585 - block
    b894 - block
    b999 - block
    b469 - block
    b764 - block
    b409 - block
    b627 - block
    b379 - block
    b416 - block
    b233 - block
    b845 - block
    b224 - block
    b583 - block
    b896 - block
    b979 - block
    b512 - block
    b756 - block
    b649 - block
    b249 - block
    b220 - block
    b129 - block
    b745 - block
    b272 - block
    b448 - block
    b305 - block
    b895 - block
    b834 - block
    b959 - block
    b616 - block
    b549 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b352 )
    ( on b618 b352 )
    ( on b585 b618 )
    ( on b894 b585 )
    ( on b999 b894 )
    ( on b469 b999 )
    ( on b764 b469 )
    ( on b409 b764 )
    ( on b627 b409 )
    ( on b379 b627 )
    ( on b416 b379 )
    ( on b233 b416 )
    ( on b845 b233 )
    ( on b224 b845 )
    ( on b583 b224 )
    ( on b896 b583 )
    ( on b979 b896 )
    ( on b512 b979 )
    ( on b756 b512 )
    ( on b649 b756 )
    ( on b249 b649 )
    ( on b220 b249 )
    ( on b129 b220 )
    ( on b745 b129 )
    ( on b272 b745 )
    ( on b448 b272 )
    ( on b305 b448 )
    ( on b895 b305 )
    ( on b834 b895 )
    ( on b959 b834 )
    ( on b616 b959 )
    ( on b549 b616 )
    ( clear b549 )
  )
  ( :tasks
    ( Make-31Pile b618 b585 b894 b999 b469 b764 b409 b627 b379 b416 b233 b845 b224 b583 b896 b979 b512 b756 b649 b249 b220 b129 b745 b272 b448 b305 b895 b834 b959 b616 b549 )
  )
)
