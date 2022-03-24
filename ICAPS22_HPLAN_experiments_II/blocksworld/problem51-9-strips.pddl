( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b626 - block
    b678 - block
    b943 - block
    b634 - block
    b636 - block
    b995 - block
    b986 - block
    b779 - block
    b825 - block
    b613 - block
    b889 - block
    b885 - block
    b52 - block
    b559 - block
    b827 - block
    b319 - block
    b771 - block
    b928 - block
    b447 - block
    b129 - block
    b666 - block
    b753 - block
    b324 - block
    b706 - block
    b365 - block
    b314 - block
    b265 - block
    b592 - block
    b232 - block
    b960 - block
    b421 - block
    b321 - block
    b283 - block
    b309 - block
    b855 - block
    b558 - block
    b37 - block
    b671 - block
    b110 - block
    b544 - block
    b211 - block
    b216 - block
    b513 - block
    b128 - block
    b20 - block
    b625 - block
    b44 - block
    b773 - block
    b407 - block
    b150 - block
    b755 - block
    b467 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b626 )
    ( on b678 b626 )
    ( on b943 b678 )
    ( on b634 b943 )
    ( on b636 b634 )
    ( on b995 b636 )
    ( on b986 b995 )
    ( on b779 b986 )
    ( on b825 b779 )
    ( on b613 b825 )
    ( on b889 b613 )
    ( on b885 b889 )
    ( on b52 b885 )
    ( on b559 b52 )
    ( on b827 b559 )
    ( on b319 b827 )
    ( on b771 b319 )
    ( on b928 b771 )
    ( on b447 b928 )
    ( on b129 b447 )
    ( on b666 b129 )
    ( on b753 b666 )
    ( on b324 b753 )
    ( on b706 b324 )
    ( on b365 b706 )
    ( on b314 b365 )
    ( on b265 b314 )
    ( on b592 b265 )
    ( on b232 b592 )
    ( on b960 b232 )
    ( on b421 b960 )
    ( on b321 b421 )
    ( on b283 b321 )
    ( on b309 b283 )
    ( on b855 b309 )
    ( on b558 b855 )
    ( on b37 b558 )
    ( on b671 b37 )
    ( on b110 b671 )
    ( on b544 b110 )
    ( on b211 b544 )
    ( on b216 b211 )
    ( on b513 b216 )
    ( on b128 b513 )
    ( on b20 b128 )
    ( on b625 b20 )
    ( on b44 b625 )
    ( on b773 b44 )
    ( on b407 b773 )
    ( on b150 b407 )
    ( on b755 b150 )
    ( on b467 b755 )
    ( clear b467 )
  )
  ( :goal
    ( and
      ( clear b626 )
    )
  )
)
