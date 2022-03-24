( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b767 - block
    b51 - block
    b779 - block
    b140 - block
    b114 - block
    b19 - block
    b949 - block
    b878 - block
    b139 - block
    b782 - block
    b300 - block
    b420 - block
    b265 - block
    b867 - block
    b770 - block
    b708 - block
    b53 - block
    b163 - block
    b443 - block
    b145 - block
    b650 - block
    b698 - block
    b135 - block
    b529 - block
    b138 - block
    b444 - block
    b342 - block
    b147 - block
    b916 - block
    b995 - block
    b647 - block
    b728 - block
    b123 - block
    b422 - block
    b131 - block
    b850 - block
    b429 - block
    b562 - block
    b919 - block
    b32 - block
    b503 - block
    b847 - block
    b894 - block
    b791 - block
    b758 - block
    b676 - block
    b680 - block
    b939 - block
    b496 - block
    b659 - block
    b441 - block
    b268 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b767 )
    ( on b51 b767 )
    ( on b779 b51 )
    ( on b140 b779 )
    ( on b114 b140 )
    ( on b19 b114 )
    ( on b949 b19 )
    ( on b878 b949 )
    ( on b139 b878 )
    ( on b782 b139 )
    ( on b300 b782 )
    ( on b420 b300 )
    ( on b265 b420 )
    ( on b867 b265 )
    ( on b770 b867 )
    ( on b708 b770 )
    ( on b53 b708 )
    ( on b163 b53 )
    ( on b443 b163 )
    ( on b145 b443 )
    ( on b650 b145 )
    ( on b698 b650 )
    ( on b135 b698 )
    ( on b529 b135 )
    ( on b138 b529 )
    ( on b444 b138 )
    ( on b342 b444 )
    ( on b147 b342 )
    ( on b916 b147 )
    ( on b995 b916 )
    ( on b647 b995 )
    ( on b728 b647 )
    ( on b123 b728 )
    ( on b422 b123 )
    ( on b131 b422 )
    ( on b850 b131 )
    ( on b429 b850 )
    ( on b562 b429 )
    ( on b919 b562 )
    ( on b32 b919 )
    ( on b503 b32 )
    ( on b847 b503 )
    ( on b894 b847 )
    ( on b791 b894 )
    ( on b758 b791 )
    ( on b676 b758 )
    ( on b680 b676 )
    ( on b939 b680 )
    ( on b496 b939 )
    ( on b659 b496 )
    ( on b441 b659 )
    ( on b268 b441 )
    ( clear b268 )
  )
  ( :goal
    ( and
      ( clear b767 )
    )
  )
)
