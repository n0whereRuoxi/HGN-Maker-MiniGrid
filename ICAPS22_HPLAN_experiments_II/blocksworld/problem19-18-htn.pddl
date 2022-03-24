( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b70 - block
    b126 - block
    b633 - block
    b331 - block
    b59 - block
    b144 - block
    b97 - block
    b841 - block
    b781 - block
    b520 - block
    b782 - block
    b162 - block
    b383 - block
    b988 - block
    b104 - block
    b768 - block
    b615 - block
    b440 - block
    b38 - block
    b942 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b70 )
    ( on b126 b70 )
    ( on b633 b126 )
    ( on b331 b633 )
    ( on b59 b331 )
    ( on b144 b59 )
    ( on b97 b144 )
    ( on b841 b97 )
    ( on b781 b841 )
    ( on b520 b781 )
    ( on b782 b520 )
    ( on b162 b782 )
    ( on b383 b162 )
    ( on b988 b383 )
    ( on b104 b988 )
    ( on b768 b104 )
    ( on b615 b768 )
    ( on b440 b615 )
    ( on b38 b440 )
    ( on b942 b38 )
    ( clear b942 )
  )
  ( :tasks
    ( Make-19Pile b126 b633 b331 b59 b144 b97 b841 b781 b520 b782 b162 b383 b988 b104 b768 b615 b440 b38 b942 )
  )
)
