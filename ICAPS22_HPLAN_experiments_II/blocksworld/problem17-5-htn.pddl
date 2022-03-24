( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b539 - block
    b41 - block
    b942 - block
    b277 - block
    b49 - block
    b815 - block
    b600 - block
    b726 - block
    b771 - block
    b235 - block
    b398 - block
    b711 - block
    b997 - block
    b655 - block
    b669 - block
    b896 - block
    b542 - block
    b820 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b539 )
    ( on b41 b539 )
    ( on b942 b41 )
    ( on b277 b942 )
    ( on b49 b277 )
    ( on b815 b49 )
    ( on b600 b815 )
    ( on b726 b600 )
    ( on b771 b726 )
    ( on b235 b771 )
    ( on b398 b235 )
    ( on b711 b398 )
    ( on b997 b711 )
    ( on b655 b997 )
    ( on b669 b655 )
    ( on b896 b669 )
    ( on b542 b896 )
    ( on b820 b542 )
    ( clear b820 )
  )
  ( :tasks
    ( Make-17Pile b41 b942 b277 b49 b815 b600 b726 b771 b235 b398 b711 b997 b655 b669 b896 b542 b820 )
  )
)
