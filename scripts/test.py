# # #first lesson

# # import plotly;

# # print('hello world!!')
# # print('what is your name?')
# # myName = input()
# # print('its good to meet you, ' + myName)
# # print('the length of your name is: ')
# # print(len(myName))
# # print('what is your age')
# # myAge = input()
# # print('in one year you will be ' + str(int(myAge)+1) + ' years old')

# # while True:
# # 	print('hulllooo')

# # import sys

# # while True:
# #     print('Type exit to exit.')
# #     response = input()
# #     if response == 'exit':
# #         sys.exit()
# #     print('You typed ' + response + '.')

# import random
# def getAnswer(answerNumber):
# 	if answerNumber == 1:
# 		return 'It is certain'
# 	elif answerNumber == 2:
# 		return 'It is decidedly so'
# 	elif answerNumber == 3:
# 		return 'Yes'
# 	elif answerNumber == 4:
# 		return 'Reply hazy try again'
# 	elif answerNumber == 5:
# 		return 'Ask again later'
# 	elif answerNumber == 6:
# 		return 'Concentrate and ask again'
# 	elif answerNumber == 7:
# 		return 'My reply is no'
# 	elif answerNumber == 8:
# 		return 'Outlook not so good'
# 	elif answerNumber == 9:
# 		return 'Very doubtful'

# r = random.randint(1, 9)
# fortune = getAnswer(r)
# print(fortune)

# This is a guess the number game.
import random
secretNumber = random.randint(1, 20)
print('I am thinking of a number between 1 and 20.')

# Ask the player to guess 6 times.
for guessesTaken in range(1, 7):
	print('Take a guess.')
	guess = int(input())

	if guess < secretNumber:
		print('Your guess is too low.')
	elif guess > secretNumber:
		print('Your guess is too high.')
	else:
		break    # This condition is the correct guess!

if guess == secretNumber:
	print('Good job! You guessed my number in ' + str(guessesTaken) + ' guesses!')
else:
	print('Nope. The number I was thinking of was ' + str(secretNumber))
