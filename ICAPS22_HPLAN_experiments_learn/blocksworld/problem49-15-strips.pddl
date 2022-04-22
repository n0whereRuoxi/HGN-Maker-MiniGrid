( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b652 - block
    b264 - block
    b762 - block
    b876 - block
    b158 - block
    b808 - block
    b461 - block
    b175 - block
    b597 - block
    b794 - block
    b736 - block
    b287 - block
    b880 - block
    b293 - block
    b903 - block
    b47 - block
    b749 - block
    b30 - block
    b765 - block
    b200 - block
    b91 - block
    b796 - block
    b14 - block
    b629 - block
    b728 - block
    b910 - block
    b261 - block
    b274 - block
    b959 - block
    b124 - block
    b926 - block
    b942 - block
    b865 - block
    b141 - block
    b214 - block
    b36 - block
    b211 - block
    b611 - block
    b85 - block
    b907 - block
    b480 - block
    b71 - block
    b308 - block
    b529 - block
    b897 - block
    b439 - block
    b116 - block
    b834 - block
    b54 - block
    b994 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b652 )
    ( on b264 b652 )
    ( on b762 b264 )
    ( on b876 b762 )
    ( on b158 b876 )
    ( on b808 b158 )
    ( on b461 b808 )
    ( on b175 b461 )
    ( on b597 b175 )
    ( on b794 b597 )
    ( on b736 b794 )
    ( on b287 b736 )
    ( on b880 b287 )
    ( on b293 b880 )
    ( on b903 b293 )
    ( on b47 b903 )
    ( on b749 b47 )
    ( on b30 b749 )
    ( on b765 b30 )
    ( on b200 b765 )
    ( on b91 b200 )
    ( on b796 b91 )
    ( on b14 b796 )
    ( on b629 b14 )
    ( on b728 b629 )
    ( on b910 b728 )
    ( on b261 b910 )
    ( on b274 b261 )
    ( on b959 b274 )
    ( on b124 b959 )
    ( on b926 b124 )
    ( on b942 b926 )
    ( on b865 b942 )
    ( on b141 b865 )
    ( on b214 b141 )
    ( on b36 b214 )
    ( on b211 b36 )
    ( on b611 b211 )
    ( on b85 b611 )
    ( on b907 b85 )
    ( on b480 b907 )
    ( on b71 b480 )
    ( on b308 b71 )
    ( on b529 b308 )
    ( on b897 b529 )
    ( on b439 b897 )
    ( on b116 b439 )
    ( on b834 b116 )
    ( on b54 b834 )
    ( on b994 b54 )
    ( clear b994 )
  )
  ( :goal
    ( and
      ( clear b652 )
    )
  )
)
