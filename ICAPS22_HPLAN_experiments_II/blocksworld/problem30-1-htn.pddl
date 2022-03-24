( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b251 - block
    b625 - block
    b878 - block
    b788 - block
    b933 - block
    b738 - block
    b941 - block
    b412 - block
    b470 - block
    b135 - block
    b157 - block
    b573 - block
    b720 - block
    b55 - block
    b633 - block
    b47 - block
    b472 - block
    b715 - block
    b201 - block
    b958 - block
    b160 - block
    b644 - block
    b997 - block
    b467 - block
    b512 - block
    b586 - block
    b454 - block
    b324 - block
    b243 - block
    b222 - block
    b81 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b251 )
    ( on b625 b251 )
    ( on b878 b625 )
    ( on b788 b878 )
    ( on b933 b788 )
    ( on b738 b933 )
    ( on b941 b738 )
    ( on b412 b941 )
    ( on b470 b412 )
    ( on b135 b470 )
    ( on b157 b135 )
    ( on b573 b157 )
    ( on b720 b573 )
    ( on b55 b720 )
    ( on b633 b55 )
    ( on b47 b633 )
    ( on b472 b47 )
    ( on b715 b472 )
    ( on b201 b715 )
    ( on b958 b201 )
    ( on b160 b958 )
    ( on b644 b160 )
    ( on b997 b644 )
    ( on b467 b997 )
    ( on b512 b467 )
    ( on b586 b512 )
    ( on b454 b586 )
    ( on b324 b454 )
    ( on b243 b324 )
    ( on b222 b243 )
    ( on b81 b222 )
    ( clear b81 )
  )
  ( :tasks
    ( Make-30Pile b625 b878 b788 b933 b738 b941 b412 b470 b135 b157 b573 b720 b55 b633 b47 b472 b715 b201 b958 b160 b644 b997 b467 b512 b586 b454 b324 b243 b222 b81 )
  )
)
