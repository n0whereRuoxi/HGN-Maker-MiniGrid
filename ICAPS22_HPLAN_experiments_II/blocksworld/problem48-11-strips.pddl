( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b310 - block
    b749 - block
    b267 - block
    b898 - block
    b700 - block
    b716 - block
    b794 - block
    b51 - block
    b141 - block
    b624 - block
    b834 - block
    b412 - block
    b667 - block
    b866 - block
    b236 - block
    b788 - block
    b774 - block
    b762 - block
    b783 - block
    b587 - block
    b521 - block
    b621 - block
    b99 - block
    b173 - block
    b971 - block
    b242 - block
    b97 - block
    b3 - block
    b616 - block
    b164 - block
    b77 - block
    b907 - block
    b819 - block
    b337 - block
    b638 - block
    b605 - block
    b16 - block
    b404 - block
    b603 - block
    b796 - block
    b617 - block
    b663 - block
    b996 - block
    b43 - block
    b170 - block
    b879 - block
    b90 - block
    b854 - block
    b150 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b310 )
    ( on b749 b310 )
    ( on b267 b749 )
    ( on b898 b267 )
    ( on b700 b898 )
    ( on b716 b700 )
    ( on b794 b716 )
    ( on b51 b794 )
    ( on b141 b51 )
    ( on b624 b141 )
    ( on b834 b624 )
    ( on b412 b834 )
    ( on b667 b412 )
    ( on b866 b667 )
    ( on b236 b866 )
    ( on b788 b236 )
    ( on b774 b788 )
    ( on b762 b774 )
    ( on b783 b762 )
    ( on b587 b783 )
    ( on b521 b587 )
    ( on b621 b521 )
    ( on b99 b621 )
    ( on b173 b99 )
    ( on b971 b173 )
    ( on b242 b971 )
    ( on b97 b242 )
    ( on b3 b97 )
    ( on b616 b3 )
    ( on b164 b616 )
    ( on b77 b164 )
    ( on b907 b77 )
    ( on b819 b907 )
    ( on b337 b819 )
    ( on b638 b337 )
    ( on b605 b638 )
    ( on b16 b605 )
    ( on b404 b16 )
    ( on b603 b404 )
    ( on b796 b603 )
    ( on b617 b796 )
    ( on b663 b617 )
    ( on b996 b663 )
    ( on b43 b996 )
    ( on b170 b43 )
    ( on b879 b170 )
    ( on b90 b879 )
    ( on b854 b90 )
    ( on b150 b854 )
    ( clear b150 )
  )
  ( :goal
    ( and
      ( clear b310 )
    )
  )
)
