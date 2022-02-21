( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b705 - block
    b307 - block
    b775 - block
    b567 - block
    b245 - block
    b758 - block
    b829 - block
    b316 - block
    b673 - block
    b762 - block
    b59 - block
    b415 - block
    b244 - block
    b797 - block
    b519 - block
    b854 - block
    b390 - block
    b960 - block
    b947 - block
    b376 - block
    b266 - block
    b88 - block
    b565 - block
    b99 - block
    b359 - block
    b846 - block
    b171 - block
    b161 - block
    b34 - block
    b57 - block
    b938 - block
    b13 - block
    b802 - block
    b946 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b705 )
    ( on b307 b705 )
    ( on b775 b307 )
    ( on b567 b775 )
    ( on b245 b567 )
    ( on b758 b245 )
    ( on b829 b758 )
    ( on b316 b829 )
    ( on b673 b316 )
    ( on b762 b673 )
    ( on b59 b762 )
    ( on b415 b59 )
    ( on b244 b415 )
    ( on b797 b244 )
    ( on b519 b797 )
    ( on b854 b519 )
    ( on b390 b854 )
    ( on b960 b390 )
    ( on b947 b960 )
    ( on b376 b947 )
    ( on b266 b376 )
    ( on b88 b266 )
    ( on b565 b88 )
    ( on b99 b565 )
    ( on b359 b99 )
    ( on b846 b359 )
    ( on b171 b846 )
    ( on b161 b171 )
    ( on b34 b161 )
    ( on b57 b34 )
    ( on b938 b57 )
    ( on b13 b938 )
    ( on b802 b13 )
    ( on b946 b802 )
    ( clear b946 )
  )
  ( :goal
    ( and
      ( clear b705 )
    )
  )
)
