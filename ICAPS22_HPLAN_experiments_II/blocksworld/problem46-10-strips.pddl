( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b615 - block
    b502 - block
    b466 - block
    b583 - block
    b743 - block
    b265 - block
    b214 - block
    b371 - block
    b494 - block
    b48 - block
    b173 - block
    b443 - block
    b679 - block
    b77 - block
    b879 - block
    b817 - block
    b354 - block
    b933 - block
    b735 - block
    b147 - block
    b937 - block
    b393 - block
    b314 - block
    b718 - block
    b128 - block
    b598 - block
    b322 - block
    b804 - block
    b16 - block
    b269 - block
    b848 - block
    b56 - block
    b960 - block
    b703 - block
    b85 - block
    b388 - block
    b504 - block
    b652 - block
    b616 - block
    b46 - block
    b936 - block
    b770 - block
    b99 - block
    b164 - block
    b499 - block
    b75 - block
    b976 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b615 )
    ( on b502 b615 )
    ( on b466 b502 )
    ( on b583 b466 )
    ( on b743 b583 )
    ( on b265 b743 )
    ( on b214 b265 )
    ( on b371 b214 )
    ( on b494 b371 )
    ( on b48 b494 )
    ( on b173 b48 )
    ( on b443 b173 )
    ( on b679 b443 )
    ( on b77 b679 )
    ( on b879 b77 )
    ( on b817 b879 )
    ( on b354 b817 )
    ( on b933 b354 )
    ( on b735 b933 )
    ( on b147 b735 )
    ( on b937 b147 )
    ( on b393 b937 )
    ( on b314 b393 )
    ( on b718 b314 )
    ( on b128 b718 )
    ( on b598 b128 )
    ( on b322 b598 )
    ( on b804 b322 )
    ( on b16 b804 )
    ( on b269 b16 )
    ( on b848 b269 )
    ( on b56 b848 )
    ( on b960 b56 )
    ( on b703 b960 )
    ( on b85 b703 )
    ( on b388 b85 )
    ( on b504 b388 )
    ( on b652 b504 )
    ( on b616 b652 )
    ( on b46 b616 )
    ( on b936 b46 )
    ( on b770 b936 )
    ( on b99 b770 )
    ( on b164 b99 )
    ( on b499 b164 )
    ( on b75 b499 )
    ( on b976 b75 )
    ( clear b976 )
  )
  ( :goal
    ( and
      ( clear b615 )
    )
  )
)
