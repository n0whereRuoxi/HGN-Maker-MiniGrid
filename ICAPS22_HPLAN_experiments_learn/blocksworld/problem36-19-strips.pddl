( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b458 - block
    b937 - block
    b292 - block
    b703 - block
    b592 - block
    b241 - block
    b243 - block
    b229 - block
    b798 - block
    b51 - block
    b254 - block
    b331 - block
    b248 - block
    b19 - block
    b622 - block
    b630 - block
    b900 - block
    b392 - block
    b685 - block
    b210 - block
    b507 - block
    b935 - block
    b927 - block
    b767 - block
    b827 - block
    b420 - block
    b374 - block
    b103 - block
    b946 - block
    b68 - block
    b159 - block
    b660 - block
    b988 - block
    b559 - block
    b794 - block
    b9 - block
    b753 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b458 )
    ( on b937 b458 )
    ( on b292 b937 )
    ( on b703 b292 )
    ( on b592 b703 )
    ( on b241 b592 )
    ( on b243 b241 )
    ( on b229 b243 )
    ( on b798 b229 )
    ( on b51 b798 )
    ( on b254 b51 )
    ( on b331 b254 )
    ( on b248 b331 )
    ( on b19 b248 )
    ( on b622 b19 )
    ( on b630 b622 )
    ( on b900 b630 )
    ( on b392 b900 )
    ( on b685 b392 )
    ( on b210 b685 )
    ( on b507 b210 )
    ( on b935 b507 )
    ( on b927 b935 )
    ( on b767 b927 )
    ( on b827 b767 )
    ( on b420 b827 )
    ( on b374 b420 )
    ( on b103 b374 )
    ( on b946 b103 )
    ( on b68 b946 )
    ( on b159 b68 )
    ( on b660 b159 )
    ( on b988 b660 )
    ( on b559 b988 )
    ( on b794 b559 )
    ( on b9 b794 )
    ( on b753 b9 )
    ( clear b753 )
  )
  ( :goal
    ( and
      ( clear b458 )
    )
  )
)
