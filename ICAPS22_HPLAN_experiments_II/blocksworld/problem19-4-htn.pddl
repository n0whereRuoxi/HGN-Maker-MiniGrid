( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b936 - block
    b908 - block
    b59 - block
    b57 - block
    b877 - block
    b456 - block
    b198 - block
    b164 - block
    b605 - block
    b759 - block
    b337 - block
    b357 - block
    b159 - block
    b596 - block
    b591 - block
    b89 - block
    b638 - block
    b726 - block
    b632 - block
    b409 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b936 )
    ( on b908 b936 )
    ( on b59 b908 )
    ( on b57 b59 )
    ( on b877 b57 )
    ( on b456 b877 )
    ( on b198 b456 )
    ( on b164 b198 )
    ( on b605 b164 )
    ( on b759 b605 )
    ( on b337 b759 )
    ( on b357 b337 )
    ( on b159 b357 )
    ( on b596 b159 )
    ( on b591 b596 )
    ( on b89 b591 )
    ( on b638 b89 )
    ( on b726 b638 )
    ( on b632 b726 )
    ( on b409 b632 )
    ( clear b409 )
  )
  ( :tasks
    ( Make-19Pile b908 b59 b57 b877 b456 b198 b164 b605 b759 b337 b357 b159 b596 b591 b89 b638 b726 b632 b409 )
  )
)
