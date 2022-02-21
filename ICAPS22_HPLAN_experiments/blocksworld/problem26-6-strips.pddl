( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b845 - block
    b963 - block
    b555 - block
    b995 - block
    b803 - block
    b340 - block
    b753 - block
    b132 - block
    b916 - block
    b508 - block
    b198 - block
    b914 - block
    b535 - block
    b145 - block
    b87 - block
    b984 - block
    b210 - block
    b116 - block
    b569 - block
    b429 - block
    b850 - block
    b774 - block
    b442 - block
    b470 - block
    b189 - block
    b905 - block
    b710 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b845 )
    ( on b963 b845 )
    ( on b555 b963 )
    ( on b995 b555 )
    ( on b803 b995 )
    ( on b340 b803 )
    ( on b753 b340 )
    ( on b132 b753 )
    ( on b916 b132 )
    ( on b508 b916 )
    ( on b198 b508 )
    ( on b914 b198 )
    ( on b535 b914 )
    ( on b145 b535 )
    ( on b87 b145 )
    ( on b984 b87 )
    ( on b210 b984 )
    ( on b116 b210 )
    ( on b569 b116 )
    ( on b429 b569 )
    ( on b850 b429 )
    ( on b774 b850 )
    ( on b442 b774 )
    ( on b470 b442 )
    ( on b189 b470 )
    ( on b905 b189 )
    ( on b710 b905 )
    ( clear b710 )
  )
  ( :goal
    ( and
      ( clear b845 )
    )
  )
)
