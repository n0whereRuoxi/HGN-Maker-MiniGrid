( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b638 - block
    b459 - block
    b124 - block
    b837 - block
    b482 - block
    b873 - block
    b641 - block
    b598 - block
    b775 - block
    b181 - block
    b558 - block
    b755 - block
    b892 - block
    b948 - block
    b942 - block
    b229 - block
    b231 - block
    b347 - block
    b480 - block
    b550 - block
    b9 - block
    b865 - block
    b469 - block
    b460 - block
    b156 - block
    b894 - block
    b928 - block
    b176 - block
    b876 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b638 )
    ( on b459 b638 )
    ( on b124 b459 )
    ( on b837 b124 )
    ( on b482 b837 )
    ( on b873 b482 )
    ( on b641 b873 )
    ( on b598 b641 )
    ( on b775 b598 )
    ( on b181 b775 )
    ( on b558 b181 )
    ( on b755 b558 )
    ( on b892 b755 )
    ( on b948 b892 )
    ( on b942 b948 )
    ( on b229 b942 )
    ( on b231 b229 )
    ( on b347 b231 )
    ( on b480 b347 )
    ( on b550 b480 )
    ( on b9 b550 )
    ( on b865 b9 )
    ( on b469 b865 )
    ( on b460 b469 )
    ( on b156 b460 )
    ( on b894 b156 )
    ( on b928 b894 )
    ( on b176 b928 )
    ( on b876 b176 )
    ( clear b876 )
  )
  ( :goal
    ( and
      ( clear b638 )
    )
  )
)
