( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b7 - block
    b576 - block
    b809 - block
    b822 - block
    b223 - block
    b102 - block
    b268 - block
    b237 - block
    b38 - block
    b210 - block
    b465 - block
    b790 - block
    b410 - block
    b914 - block
    b833 - block
    b863 - block
    b252 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b7 )
    ( on b576 b7 )
    ( on b809 b576 )
    ( on b822 b809 )
    ( on b223 b822 )
    ( on b102 b223 )
    ( on b268 b102 )
    ( on b237 b268 )
    ( on b38 b237 )
    ( on b210 b38 )
    ( on b465 b210 )
    ( on b790 b465 )
    ( on b410 b790 )
    ( on b914 b410 )
    ( on b833 b914 )
    ( on b863 b833 )
    ( on b252 b863 )
    ( clear b252 )
  )
  ( :tasks
    ( Make-16Pile b576 b809 b822 b223 b102 b268 b237 b38 b210 b465 b790 b410 b914 b833 b863 b252 )
  )
)
